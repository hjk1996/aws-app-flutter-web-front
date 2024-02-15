import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/repository/search_repository.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/model/state_model/face_search_state.dart';

class FaceSearchProvider extends ChangeNotifier {
  FaceSearchProvider({
    required this.imageRepository,
    required this.searchRepository,
    required FaceSearchState initialState,
  }) : _state = initialState;

  final ImageRepository imageRepository;
  final SearchRepository searchRepository;
  late FaceSearchState _state;
  FaceSearchState get state => _state;

  Future<void> searchFaces(PlatformFile file) async {
    try {
      _state = _state.copyWith(loading: true);
      notifyListeners();
      final searchResult = await searchRepository.searchFaces(file);
      print("searchResult: $searchResult");
      final thumbnailImageDataList =
          await imageRepository.getThumbnailImageDataList(
        imageUrls: searchResult.map((e) => e.imageUrl).toList(),
      );

      if (thumbnailImageDataList == null) {
        _state = _state.copyWith(loading: false);
        notifyListeners();
        return;
      }

      final imageItemList = List.generate(
        searchResult.length,
        (index) => AppImageItem(
          imageMetadata: searchResult[index],
          imageData: thumbnailImageDataList[index],
        ),
      );

      _state = _state.copyWith(loading: false, searchResult: imageItemList);
      notifyListeners();
    } on DioException catch (err) {
      _state = _state.copyWith(loading: false);
      notifyListeners();
    } on Exception catch (err) {
      _state = _state.copyWith(loading: false);
      notifyListeners();
    }
  }
}
