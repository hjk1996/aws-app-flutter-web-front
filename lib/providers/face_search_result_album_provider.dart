import 'dart:async';
import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/event/image_event.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/model/state_model/face_search_result_album_state.dart';

class FaceSearchResultAlbumProvider with ChangeNotifier {
  FaceSearchResultAlbumProvider({
    required ImageRepository imageRepository,
    required FaceSearchResultAlbumState initialState,
    required List<AppImageItem> imageItemList,
  })  : _imageRepository = imageRepository,
        _state = initialState,
        _imageItemList = imageItemList;

  final ImageRepository _imageRepository;
  late List<AppImageItem> _imageItemList;
  List<AppImageItem> get imageItemList => _imageItemList;
  late FaceSearchResultAlbumState _state;
  FaceSearchResultAlbumState get state => _state;

  final _imageEventController = StreamController<ImageEvent>.broadcast();
  Stream<ImageEvent> get imageEventStream => _imageEventController.stream;

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

      _imageEventController.sink.add(const ImageEvent.onImageDeleteSuccess());
    } on Exception catch (err) {
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
      // rollback
      print(err);
      imageItemList[_state.currentImageIndex!] =
          imageItemList[_state.currentImageIndex!].copyWith(
        imageMetadata: oldImageMetadata,
      );
      _imageEventController.sink.add(ImageEvent.error(err));
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
    } catch (err) {
      print(err);
    }
  }
}
