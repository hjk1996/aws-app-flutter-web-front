import 'dart:async';
import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/event/search_event.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/repository/search_repository.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/model/state_model/face_search_state.dart';

class FaceSearchProvider extends ChangeNotifier {
  FaceSearchProvider({
    required ImageRepository imageRepository,
    required SearchRepository searchRepository,
    required FaceSearchState initialState,
  }) {
    _state = initialState;
    _imageRepository = imageRepository;
    _searchRepository = searchRepository;
  }

  List<AppImageItem> _imageItemList = [];
  List<AppImageItem> get imageItemList => _imageItemList;
  late final ImageRepository _imageRepository;
  late final SearchRepository _searchRepository;
  late FaceSearchState _state;
  final StreamController<SearchEvent> _eventController =
      StreamController<SearchEvent>.broadcast();
  Stream<SearchEvent> get eventStream => _eventController.stream;
  FaceSearchState get state => _state;

  Future<void> resetFaceIndex() async {
    try {
      _state = _state.copyWith(loading: true);
      notifyListeners();
      await _searchRepository.resetFaceIndex();
    } on DioException catch (err) {
      _eventController.add(SearchEvent.error(err.toString()));
    } on Exception catch (err) {
      _eventController.add(SearchEvent.error(err.toString()));
    } finally {
      _state = _state.copyWith(loading: false);
      notifyListeners();
    }
  }

  Future<void> searchFaces(PlatformFile file) async {
    try {
      _state = _state.copyWith(loading: true);
      notifyListeners();
      final searchResult = await _searchRepository.searchFaces(file);
      final thumbnailImageDataList = await _imageRepository.getImageDataList(
          imageUrls: searchResult.map((e) => e.imageUrl).toList(),
          isThumbnail: true);

      if (thumbnailImageDataList == null) {
        print('thumbnailImageDataList is null');
        _state = _state.copyWith(loading: false);
        notifyListeners();

        return;
      }

      _imageItemList = List.generate(
        searchResult.length,
        (index) => AppImageItem(
          imageMetadata: searchResult[index],
          imageData: thumbnailImageDataList[index],
        ),
      );
    } on DioException catch (err) {
      final String errorType = err.response?.data['detail'] ?? '';
      if (errorType == "InvalidParameterException") {
        _eventController.add(
          const SearchEvent.error("No face detected in the image"),
        );
      } else if (errorType == "NoMatchesFoundInDB") {
        _eventController.add(
          const SearchEvent.error(
              "Found faces in Rekognition Index, but no matches in the database"),
        );
      } else {
        _eventController.add(SearchEvent.error(errorType));
      }
    } on Exception catch (err) {
      _eventController.add(SearchEvent.error(err.toString()));
    } finally {
      _state = _state.copyWith(loading: false);
      notifyListeners();
    }
  }

  Future<void> setCurrentImageIndex(int index) async {
    _state = _state.copyWith(currentImageIndex: index);
    notifyListeners();

    if (_imageItemList[index].imageData.original != null) {
      return;
    }
    await getOriginalImage(index);
  }

  Future<void> getOriginalImage(int index) async {
    try {
      if (_imageItemList.isEmpty || _state.currentImageIndex == null) {
        return;
      }

      final imageBytes = await _imageRepository.getOriginalImageBytes(
        imageUrl: _imageItemList[index].imageMetadata.imageUrl,
      );

      if (imageBytes == null) {
        throw Exception("get original image failed");
      }

      final newImageItem = AppImageItem(
        imageMetadata: _imageItemList[index].imageMetadata,
        imageData: AppImageData(
          selected: false,
          thumbnail: _imageItemList[index].imageData.thumbnail,
          original: imageBytes,
        ),
      );

      _imageItemList[index] = newImageItem;
    } on DioException catch (err) {
      print(err);
    } on Exception catch (err) {
      print(err);
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteCurrentImage() async {
    try {
      if (imageItemList.isEmpty || _state.currentImageIndex == null) {
        return;
      }

      final okay = await _imageRepository.deleteImages(
        imageMetadataList: [
          imageItemList[_state.currentImageIndex!].imageMetadata
        ],
      );

      int? newCurrentImageIndex = _state.currentImageIndex! - 1;
      if (newCurrentImageIndex < 0) {
        newCurrentImageIndex = null;
      }

      imageItemList.removeAt(_state.currentImageIndex!);
      _state = _state.copyWith(currentImageIndex: newCurrentImageIndex);

      _eventController.sink
          .add(const SearchEvent.onCurrentImageDeleteSuccess());
    } on Exception catch (err) {
      _eventController.sink.add(SearchEvent.error(err.toString()));
    } finally {
      notifyListeners();
    }
  }

  Future<void> toggleBookmark() async {
    if (imageItemList.isEmpty || _state.currentImageIndex == null) {
      return;
    }

    final oldImageMetadata =
        imageItemList[_state.currentImageIndex!].imageMetadata;

    final newImageMetadata = oldImageMetadata.copyWith(
      bookmarked: !oldImageMetadata.bookmarked,
    );

    notifyListeners();
    try {
      await _imageRepository.toggleBookmark(
        imageMetadata: newImageMetadata,
      );

      imageItemList[_state.currentImageIndex!] =
          imageItemList[_state.currentImageIndex!].copyWith(
        imageMetadata: newImageMetadata,
      );
      // request to server
    } on Exception catch (err) {
      imageItemList[_state.currentImageIndex!] =
          imageItemList[_state.currentImageIndex!].copyWith(
        imageMetadata: oldImageMetadata,
      );
      _eventController.sink.add(SearchEvent.error(err.toString()));
    } finally {
      notifyListeners();
    }
  }

  Future<void> downloadCurrentImage() async {
    try {
      if (state.currentImageIndex == null ||
          imageItemList[state.currentImageIndex!].imageData.original == null) {
        return;
      }
      final fileName =
          imageItemList[state.currentImageIndex!].imageMetadata.imageUrl;
      final imageBytes =
          imageItemList[state.currentImageIndex!].imageData.original!;
      final blob = html.Blob([imageBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      // <a> 태그를 생성하고 설정
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", fileName)
        ..click(); // 클릭 이벤트를 프로그래매틱하게 발생시켜 다운로드 시작

      // 메모리 해제를 위해 생성된 URL을 해제
      html.Url.revokeObjectUrl(url);
    } on Exception catch (err) {
      _eventController.sink.add(SearchEvent.error(err.toString()));
    }
  }
}
