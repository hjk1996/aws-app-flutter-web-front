import 'dart:async';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/event/image_event.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/state_model/gallery_state.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AppImageProvider with ChangeNotifier {
  AppImageProvider({
    required ImageRepository imageRepository,
    required GalleryState initialState,
  }) {
    _imageRepository = imageRepository;
    _state = initialState;
  }
  late final ImageRepository _imageRepository;
  late GalleryState _state;

  final pagingController = PagingController<int, AppImageItem>(
    firstPageKey: 1,
  );

  Set<int> _selectedImageIndexes = {};
  Set<int> get selectedImageIndexes => _selectedImageIndexes;

  final _imageEventController = StreamController<ImageEvent>.broadcast();
  Stream<ImageEvent> get imageEventStream => _imageEventController.stream;

  GalleryState get state => _state;

  void toggleLoading() {
    _state = _state.copyWith(loading: !_state.loading);
    notifyListeners();
  }

  void init() {
    pagingController.addPageRequestListener((pageKey) {
      getNextImages(pageKey: pageKey);
    });
    pagingController.addStatusListener((status) {
    });
  }

  Future<void> getNextImages({
    required int pageKey,
    int? limit,
  }) async {
    try {
      print("getNextPage called");
      print(
          "old imageMetadataList: ${_state.imageMetadataList.map((e) => e.pictureId).toList()}");
      // image metadata list 가져오기
      final newImageMetadataList = await _imageRepository.getImageMetadataList(
        limit: limit ?? 20,
        afterThisImageId: _state.imageMetadataList.isNotEmpty
            ? _state.imageMetadataList.last.pictureId
            : null,
      );

      if (newImageMetadataList == null) {
        throw Exception("get images failed");
      }

      print(
          "newImageMetadataList: ${newImageMetadataList.map((e) => e.pictureId).toList()}");

      // image data list 가져오기
      final newImageDataList = await _imageRepository.getThumbnailImageDataList(
        imageMetadataList: newImageMetadataList,
      );

      if (newImageDataList == null) {
        throw Exception("get images failed");
      }

      _state = _state.copyWith(imageMetadataList: [
        ..._state.imageMetadataList,
        ...newImageMetadataList,
      ]);

      final isLastPage = newImageMetadataList.isEmpty ||
          newImageDataList.isEmpty ||
          newImageMetadataList.length < 20;

      if (isLastPage) {
        pagingController.appendLastPage(
          List.generate(
            newImageMetadataList.length,
            (index) => AppImageItem(
              imageMetadata: newImageMetadataList[index],
              imageData: newImageDataList[index],
            ),
          ),
        );
      } else {
        final nextPageKey = pageKey + newImageMetadataList.length;
        pagingController.appendPage(
          List.generate(
            newImageMetadataList.length,
            (index) => AppImageItem(
              imageMetadata: newImageMetadataList[index],
              imageData: newImageDataList[index],
            ),
          ),
          nextPageKey,
        );
      }
    } on DioException catch (err) {
      pagingController.error = err;
      print("${err.response?.data}");
    } on Exception catch (err) {
      pagingController.error = err;
      print(err);
    } finally {}
  }


  Future<void> uploadFiles() async {
    try {
      toggleLoading();
      var picked = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg', 'zip'],
        allowMultiple: true,
      );

      if (picked == null) {
        return;
      }

      final newImageMetadataList = await _imageRepository.uploadFiles(
        imageDataList: picked.files,
      );
      if (newImageMetadataList == null) {
        throw Exception("upload failed");
      }

      _state = _state.copyWith(
        imageMetadataList: [
          ...newImageMetadataList,
          ..._state.imageMetadataList,
        ],
      );

      final newImageItemList = <AppImageItem>[];

      for (var i = 0; i < picked.files.length; i++) {
        final imageData = AppImageData(
          selected: false,
          thumbnail: picked.files[i].bytes,
          original: null,
        );
        final newImageItem = AppImageItem(
          imageMetadata: newImageMetadataList[i],
          imageData: imageData,
        );
        newImageItemList.add(newImageItem);
      }

      pagingController.itemList!.insertAll(0, newImageItemList);
      pagingController.notifyStatusListeners(PagingStatus.completed);

      // for (var i = 0; i < picked.files.length; i++) {
      //   final imageData = AppImageData(
      //     selected: false,
      //     thumbnail: picked.files[i].bytes,
      //     original: null,
      //   );
      //   _imageDataList.insert(0, imageData);
      //   pagingController.itemList!.insert(
      //     0,
      //     AppImageItem(
      //       imageMetadata: newImageMetadataList[i],
      //       imageData: imageData,
      //     ),
      //   );
      // }

      _imageEventController.sink.add(const ImageEvent.onImageUploadSuccess());
    } on Exception catch (err) {
      print(err);
    } finally {
      toggleLoading();
    }
  }


  Future<void> deleteCurrentImage() async {
    try {
      if (_state.imageMetadataList.isEmpty ||
          _state.currentImageIndex == null) {
        return;
      }

      final okay = await _imageRepository.deleteImages(
        imageMetadataList: [
          _state.imageMetadataList[_state.currentImageIndex!]
        ],
      );

      _state = _state.copyWith(
        imageMetadataList: [
          ..._state.imageMetadataList.sublist(0, _state.currentImageIndex!),
          ..._state.imageMetadataList.sublist(_state.currentImageIndex! + 1),
        ],
      );
      pagingController.itemList!.removeAt(_state.currentImageIndex!);
    } on Exception catch (err) {
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteSelectedImage() async {
    try {
      if (_selectedImageIndexes.isEmpty) return;

      // 선택된 이미지 인덱스를 내림차순으로 정렬
      final selectedImageIndexList = _selectedImageIndexes.toList()
        ..sort((a, b) => b.compareTo(a));

      // 삭제할 이미지 메타데이터 리스트 생성
      final imagesToDelete = selectedImageIndexList
          .map((index) => _state.imageMetadataList[index])
          .toList();

      final newImageMetadataList = <AppImageMetadata>[];

      for (var i = 0; i < _state.imageMetadataList.length; i++) {
        if (!selectedImageIndexes.contains(i)) {
          newImageMetadataList.add(_state.imageMetadataList[i]);
        }
      }
      // 이미지 삭제 실행
      await _imageRepository.deleteImages(imageMetadataList: imagesToDelete);

      _state = _state.copyWith(imageMetadataList: newImageMetadataList);

      // 삭제된 이미지를 상태와 pagingController에서 제거
      for (var index in selectedImageIndexList) {
        pagingController.itemList!.removeAt(index);
      }

      // 상태 업데이트
      _state = _state.copyWith(
          imageMetadataList: List.from(_state.imageMetadataList));
    } on DioException catch (err) {
      // Dio 오류 처리
      pagingController.error = err;
    } catch (err) {
      // 기타 예외 처리
      print("An error occurred: $err");
    } finally {
      // 상태 변경 알림
      notifyListeners();
    }
  }

  
  void toggleSelectedMode() {
    if (_state.selectedMode) {
      _state = _state.copyWith(selectedMode: !_state.selectedMode);
      _selectedImageIndexes = {};
    } else {
      _state = _state.copyWith(selectedMode: !_state.selectedMode);
      _selectedImageIndexes = {};
    }
    notifyListeners();
  }

  void toggleImageItemSelection(int index) {
    if (_selectedImageIndexes.contains(index)) {
      _selectedImageIndexes.remove(index);
    } else {
      _selectedImageIndexes.add(index);
    }
    notifyListeners();
  }

  void setCurrentImageIndex(int index) {
    _state = _state.copyWith(currentImageIndex: index);
    notifyListeners();
  }

  void resetCurrentImageIndex() {
    _state = _state.copyWith(currentImageIndex: 0);
    notifyListeners();
  }

  Future<void> toggleBookMark() async {
    if (_state.imageMetadataList.isEmpty || _state.currentImageIndex == null) {
      return;
    }

    final oldImageMetadataList = _state.imageMetadataList;
    final newImageMetadata =
        _state.imageMetadataList[_state.currentImageIndex!];
    final newCurrentImageMetadata = newImageMetadata.copyWith(
      bookmarked: !newImageMetadata.bookmarked,
    );

    final okay = await _imageRepository.toggleFavorite(
      imageMetadata: newCurrentImageMetadata,
    );

    if (!okay) {
      throw Exception("toggle bookmark failed");
    }

    final List<AppImageMetadata> newImageMetadataList = [
      ..._state.imageMetadataList.sublist(0, _state.currentImageIndex),
      newCurrentImageMetadata,
      ..._state.imageMetadataList.sublist(_state.currentImageIndex! + 1),
    ];
    _state = _state.copyWith(
      imageMetadataList: newImageMetadataList,
    );
    notifyListeners();
    try {
      // request to server
    } on Exception catch (err) {
      // rollback
      _state = _state.copyWith(
        imageMetadataList: oldImageMetadataList,
      );
    }
  }
}
