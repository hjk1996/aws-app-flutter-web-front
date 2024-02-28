import 'dart:async';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/event/search_event.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/repository/search_repository.dart';
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
  final StreamController<SearchEvent> _eventController =
      StreamController<SearchEvent>.broadcast();
  Stream<SearchEvent> get eventStream => _eventController.stream;
  FaceSearchState get state => _state;

  // void showQueryTypes() {
  //   _state = _state.copyWith(showQueryTypes: true);
  // }

  // void hideQueryTypes() {
  //   _state = _state.copyWith(showQueryTypes: false);
  // }

  // void setQueryType(QueryType queryType) {
  //   _state = _state.copyWith(queryType: queryType);
  //   notifyListeners();
  // }

  Future<void> resetFaceIndex() async {
    try {
      _state = _state.copyWith(loading: true);
      notifyListeners();
      await searchRepository.resetFaceIndex();
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
      final searchResult = await searchRepository.searchFaces(file);
      final thumbnailImageDataList = await imageRepository.getImageDataList(
          imageUrls: searchResult.map((e) => e.imageUrl).toList(),
          isThumbnail: true);

      if (thumbnailImageDataList == null) {
        print('thumbnailImageDataList is null');
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

      _state = _state.copyWith(searchResult: imageItemList);
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
}
