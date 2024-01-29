import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/model/data_model/image_metadata.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/state_model/gallery_state.dart';
import 'package:flutter_web/model/state_model/image_data.dart';
import 'package:flutter_web/model/state_model/image_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AppImageProvider with ChangeNotifier {
  AppImageProvider({
    required ImageRepository imageRepository,
  }) {
    _imageRepository = imageRepository;
  }
  late final ImageRepository _imageRepository;
  GalleryState _state = GalleryState(
    imageMetadataList: [],
    selectedMode: false,
    currentImageIndex: 0,
    totalPage: 0,
    currentPage: 0,
  );

  late PagingController<int, ImageItem>? pagingController;
  final List<ImageData> _imageDataList = [];
  List<ImageData> get imageDataList => _imageDataList;
  Set<int> _selectedImageIndexes = {};
  Set<int> get selectedImageIndexes => _selectedImageIndexes;

  GalleryState get state => _state;

  Future<void> getNextPage({
    required PagingController<int, ImageItem> pagingController,
    required int pageKey,
    int? limit,
  }) async {
    try {
      final (newImageMetadataList, newImageDataList) =
          await _imageRepository.getImages(
        limit: limit ?? 20,
        afterThisImageId: _state.imageMetadataList.isNotEmpty
            ? _state.imageMetadataList.last.id
            : null,
      );

      _state = _state.copyWith(
        imageMetadataList: [
          ..._state.imageMetadataList,
          ...newImageMetadataList,
        ],
      );

      _imageDataList.addAll(newImageDataList);
      print("newImageMetadataList: ${_state.imageMetadataList.length}");
      print("newImageDataList: ${_imageDataList.length}");

      final isLastPage = newImageMetadataList.isEmpty ||
          newImageDataList.isEmpty ||
          newImageMetadataList.length < 20;

      if (isLastPage) {
        pagingController.appendLastPage(
          List.generate(
            newImageMetadataList.length,
            (index) => ImageItem(
              imageMetadata: newImageMetadataList[index],
              imageData: newImageDataList[index],
            ),
          ),
        );
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(
          List.generate(
            newImageMetadataList.length,
            (index) => ImageItem(
              imageMetadata: newImageMetadataList[index],
              imageData: newImageDataList[index],
            ),
          ),
          nextPageKey,
        );
      }

      print("pagingController.itemList: ${pagingController.itemList!.length}");
    } on Exception catch (err) {
      pagingController.error = err;
      print(err);
    } finally {
      notifyListeners();
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

      if (!okay) {
        throw Exception("delete failed");
      }

      _state = _state.copyWith(
        imageMetadataList: [
          ..._state.imageMetadataList.sublist(0, _state.currentImageIndex!),
          ..._state.imageMetadataList.sublist(_state.currentImageIndex! + 1),
        ],
      );
      _imageDataList.removeAt(_state.currentImageIndex!);
      pagingController!.itemList!.removeAt(_state.currentImageIndex!);
    } on Exception catch (err) {
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteSelectedImage() async {
    try {
      if (selectedImageIndexes.isEmpty) return;

      final selectedImageIndexList = _selectedImageIndexes.toList()
        ..sort((a, b) => b.compareTo(a));

      final okay = await _imageRepository.deleteImages(
        imageMetadataList: selectedImageIndexList
            .map((index) => _state.imageMetadataList[index])
            .toList(),
      );

      if (!okay) {
        throw Exception("delete failed");
      }

      final newImageMetadataList = <ImageMetadata>[];

      for (var i = 0; i < selectedImageIndexList.length; i++) {
        newImageMetadataList
            .add(_state.imageMetadataList[selectedImageIndexList[i]]);
        final backIndex = selectedImageIndexList.length - 1 - i;
        _imageDataList.removeAt(selectedImageIndexList[backIndex]);
        pagingController!.itemList!.removeAt(backIndex);
      }
      _state = _state.copyWith(
        imageMetadataList: newImageMetadataList,
      );
    } on Exception catch (err) {
    } finally {
      notifyListeners();
    }
  }

  Future<void> uploadFiles(
      {required PagingController<int, ImageItem> pagingController,
      required List<PlatformFile> files}) async {
    try {
      final res = await _imageRepository.uploadFiles(
        imageDataList: files,
      );

      if (!res) {
        throw Exception("upload failed");
      }

      final (newImageMetadataList, newImageDataList) =
          await _imageRepository.getImages(
        limit: files.length,
        afterThisImageId: _state.imageMetadataList.isNotEmpty
            ? _state.imageMetadataList.first.id
            : null,
      );

      _state = _state.copyWith(
        imageMetadataList: [
          ...newImageMetadataList,
          ..._state.imageMetadataList,
        ],
      );
      _imageDataList.insertAll(0, newImageDataList);

      pagingController.itemList ??= [];
      pagingController.itemList!.insertAll(
        0,
        List.generate(
          newImageMetadataList.length,
          (index) => ImageItem(
            imageMetadata: newImageMetadataList[index],
            imageData: newImageDataList[index],
          ),
        ),
      );
    } on Exception catch (err) {
      print(err);
    } finally {
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
      bookmark: !newImageMetadata.bookmark,
    );

    final okay = await _imageRepository.toggleFavorite(
      imageMetadata: newCurrentImageMetadata,
    );

    if (!okay) {
      throw Exception("toggle bookmark failed");
    }

    final List<ImageMetadata> newImageMetadataList = [
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
