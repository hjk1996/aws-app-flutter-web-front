import 'dart:async';
import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/event/image_event.dart';
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

  void init() {
    pagingController.addPageRequestListener((pageKey) {
      getNextImages(pageKey: pageKey);
    });
  }

  Future<void> getNextImages({
    required int pageKey,
    int? limit,
  }) async {
    try {
      final newImageMetadataList = await _imageRepository.getImageMetadataList(
        limit: limit ?? 20,
        cursor: pagingController.itemList != null &&
                pagingController.itemList!.isNotEmpty
            ? pagingController.itemList!.last.imageMetadata.pictureId
            : null,
        bookmark: false,
      );

      print("newImageMetadataList: $newImageMetadataList");

      if (newImageMetadataList == null) {
        throw Exception("get images failed");
      }

      // image data list 가져오기
      final newImageDataList = await _imageRepository.getImageDataList(
        imageUrls: newImageMetadataList.map((e) => e.imageUrl).toList(),
        isThumbnail: true
      );

      if (newImageDataList == null) {
        throw Exception("get images failed");
      }

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
      print("dio error: ${err.response?.data}");
    } on Exception catch (err) {
      pagingController.error = err;
      print(err);
    } finally {}
  }

  Future<void> uploadFiles(FilePickerResult pickedFiles) async {
    try {
      _state = _state.copyWith(loading: true);
      notifyListeners();

      final newImageMetadataList = await _imageRepository.uploadFiles(
        imageDataList: pickedFiles.files,
      );

      if (newImageMetadataList == null) {
        throw Exception("upload failed");
      }

      final newImageDataList = await _imageRepository.getImageDataList(
        imageUrls: newImageMetadataList.map((e) => e.imageUrl).toList(),
        isThumbnail: false
      );

      if (newImageDataList == null) {
        throw Exception("get images failed");
      }

      final newImageItemList = List.generate(
          newImageMetadataList.length,
          (index) => AppImageItem(
                imageMetadata: newImageMetadataList[index],
                imageData: newImageDataList[index],
              ));

      pagingController.itemList!.insertAll(0, newImageItemList);
      pagingController.notifyStatusListeners(PagingStatus.completed);

      _imageEventController.sink.add(const ImageEvent.onImageUploadSuccess());
    } on Exception catch (err) {
      print(err);
    } finally {
      _state = _state.copyWith(loading: false);
      notifyListeners();
    }
  }

  Future<void> deleteCurrentImage() async {
    try {
      if (pagingController.itemList == null ||
          pagingController.itemList!.isEmpty ||
          _state.currentImageIndex == null) {
        return;
      }

      final okay = await _imageRepository.deleteImages(
        imageMetadataList: [
          pagingController.itemList![_state.currentImageIndex!].imageMetadata
        ],
      );

      int? newCurrentImageIndex = _state.currentImageIndex! - 1;
      if (newCurrentImageIndex < 0) {
        newCurrentImageIndex = null;
      }

      pagingController.itemList!.removeAt(_state.currentImageIndex!);
      _state = _state.copyWith(currentImageIndex: newCurrentImageIndex);

      _imageEventController.sink.add(const ImageEvent.onImageDeleteSuccess());
    } on Exception catch (err) {
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteSelectedImage() async {
    try {
      if (_selectedImageIndexes.isEmpty ||
          pagingController.itemList == null ||
          pagingController.itemList!.isEmpty) return;

      // 선택된 이미지 인덱스를 내림차순으로 정렬
      final selectedImageIndexList = _selectedImageIndexes.toList()
        ..sort((a, b) => b.compareTo(a));

      // 삭제할 이미지 메타데이터 리스트 생성
      final imagesToDelete = selectedImageIndexList
          .map((index) => pagingController.itemList![index].imageMetadata)
          .toList();

      // 이미지 삭제 실행
      await _imageRepository.deleteImages(imageMetadataList: imagesToDelete);

      // 삭제된 이미지를 상태와 pagingController에서 제거
      for (var index in selectedImageIndexList) {
        pagingController.itemList!.removeAt(index);
      }

      _selectedImageIndexes = {};

      _imageEventController.sink.add(const ImageEvent.onImageDeleteSuccess());
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

  void toggleImageItemSelection(int index) {
    if (_selectedImageIndexes.contains(index)) {
      _selectedImageIndexes.remove(index);
    } else {
      _selectedImageIndexes.add(index);
    }
    notifyListeners();
  }

  Future<void> setCurrentImageIndex(int index) async {
    _state = _state.copyWith(currentImageIndex: index);
    notifyListeners();

    if (pagingController.itemList![index].imageData.original != null) {
      return;
    }
    await getOriginalImage(index);
  }

  Future<void> downloadCurrentImage() async {
    try {
      if (state.currentImageIndex == null ||
          pagingController.itemList == null ||
          pagingController
                  .itemList![state.currentImageIndex!].imageData.original ==
              null) {
        return;
      }
      final fileName = pagingController
          .itemList![state.currentImageIndex!].imageMetadata.imageUrl;
      final imageBytes = pagingController
          .itemList![state.currentImageIndex!].imageData.original!;
      final blob = html.Blob([imageBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      // <a> 태그를 생성하고 설정
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", fileName)
        ..click(); // 클릭 이벤트를 프로그래매틱하게 발생시켜 다운로드 시작

      // 메모리 해제를 위해 생성된 URL을 해제
      html.Url.revokeObjectUrl(url);
    } catch (err) {
      print(err);
    }
  }

  Future<void> getOriginalImage(int index) async {
    try {
      if (pagingController.itemList == null ||
          pagingController.itemList!.isEmpty ||
          _state.currentImageIndex == null) {
        return;
      }

      final imageBytes = await _imageRepository.getOriginalImageBytes(
        imageUrl: pagingController.itemList![index].imageMetadata.imageUrl,
      );

      if (imageBytes == null) {
        throw Exception("get original image failed");
      }

      final newImageItem = AppImageItem(
        imageMetadata: pagingController.itemList![index].imageMetadata,
        imageData: AppImageData(
          selected: false,
          thumbnail: pagingController.itemList![index].imageData.thumbnail,
          original: imageBytes,
        ),
      );

      pagingController.itemList![index] = newImageItem;
    } on DioException catch (err) {
      print(err);
    } on Exception catch (err) {
      print(err);
    } finally {
      notifyListeners();
    }
  }

  void toggleSelectMode() {
    if (_state.selectMode) {
      _selectedImageIndexes = {};
    }
    _state = _state.copyWith(selectMode: !_state.selectMode);

    notifyListeners();
  }

  void resetCurrentImageIndex() {
    _state = _state.copyWith(currentImageIndex: 0);
    notifyListeners();
  }

  Future<void> toggleBookmark() async {
    if (pagingController.itemList == null ||
        pagingController.itemList!.isEmpty ||
        _state.currentImageIndex == null) {
      return;
    }

    final oldImageMetadata =
        pagingController.itemList![_state.currentImageIndex!].imageMetadata;

    final newImageMetadata = oldImageMetadata.copyWith(
      bookmarked: !oldImageMetadata.bookmarked,
    );

    notifyListeners();
    try {
      await _imageRepository.toggleBookmark(
        imageMetadata: newImageMetadata,
      );

      pagingController.itemList![_state.currentImageIndex!] =
          pagingController.itemList![_state.currentImageIndex!].copyWith(
        imageMetadata: newImageMetadata,
      );
      // request to server
    } on Exception catch (err) {
      // rollback
      print(err);
      pagingController.itemList![_state.currentImageIndex!] =
          pagingController.itemList![_state.currentImageIndex!].copyWith(
        imageMetadata: oldImageMetadata,
      );
      _imageEventController.sink.add(ImageEvent.error(err));
    } finally {
      notifyListeners();
    }
  }
}
