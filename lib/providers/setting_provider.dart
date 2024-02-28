import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/event/setting_event.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/repository/search_repository.dart';
import 'package:flutter_web/model/state_model/setting_state.dart';
import 'package:flutter_web/providers/app_image_provider.dart';

class SettingProvider extends ChangeNotifier {
  SettingProvider({
    required ImageRepository imageRepository,
    required SearchRepository searchRepository,
    required AppImageProvider appImageProvider,
    required SettingState initialState,
  }) {
    _state = initialState;
    _imageRepository = imageRepository;
    _searchRepository = searchRepository;
    _appImageProvider = appImageProvider;
  }

  late final ImageRepository _imageRepository;
  late final SearchRepository _searchRepository;
  late final AppImageProvider _appImageProvider;
  late SettingState _state;
  final StreamController<SettingEvent> _eventController =
      StreamController<SettingEvent>.broadcast();
  Stream<SettingEvent> get eventStream => _eventController.stream;
  SettingState get state => _state;

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
      await _searchRepository.resetFaceIndex();
      _eventController.sink.add(const SettingEvent.onFaceIndexResetSuccess());
    } on DioException catch (err) {
      _eventController.sink.add(SettingEvent.onFaceIndexResetFailure(err));
    } on Exception catch (err) {
      _eventController.sink.add(SettingEvent.onFaceIndexResetFailure(err));
    } finally {
      _state = _state.copyWith(loading: false);
      notifyListeners();
    }
  }

  Future<void> deleteAllImages() async {
    try {
      _state = _state.copyWith(loading: true);
      notifyListeners();
      await _imageRepository.deleteAllImages();
      _appImageProvider.pagingController.itemList = [];
      _appImageProvider.selectedImageIndexes = {};
      _appImageProvider.notifyListeners();
      _eventController.sink.add(const SettingEvent.onImageDeleteSuccess());
      notifyListeners();
    } on DioException catch (err) {
      _eventController.sink.add(SettingEvent.onImageDeleteFailure(err));
    } on Exception catch (err) {
      _eventController.sink.add(SettingEvent.onImageDeleteFailure(err));
    } finally {
      _state = _state.copyWith(loading: false);
      notifyListeners();
    }
  }

  Future<void> deleteAllImageCaptions() async {
    try {
      _state = _state.copyWith(loading: true);
      notifyListeners();
      await _searchRepository.resetImageCaptions();
      _eventController.sink
          .add(const SettingEvent.onImageCaptionResetSuccess());
      notifyListeners();
    } on DioException catch (err) {
      _eventController.sink.add(SettingEvent.onImageCaptionResetFailure(err));
    } on Exception catch (err) {
      _eventController.sink.add(SettingEvent.onImageCaptionResetFailure(err));
    } finally {
      _state = _state.copyWith(loading: false);
      notifyListeners();
    }
  }
}
