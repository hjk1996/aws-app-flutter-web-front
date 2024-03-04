import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web/event/image_tag_list_event.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/repository/search_repository.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/model/state_model/image_tag_list_state.dart';

class ImageTagListProvider with ChangeNotifier {
  ImageTagListProvider({
    required ImageRepository imageRepository,
    required SearchRepository searchRepository,
    required ImageTagListState initialState,
  }) {
    _imageRepository = imageRepository;
    _searchRepository = searchRepository;
    _state = initialState;
  }

  late final ImageRepository _imageRepository;
  late final SearchRepository _searchRepository;
  late ImageTagListState _state;
  ImageTagListState get state => _state;
  final StreamController<ImageTagListEvent> _eventController =
      StreamController<ImageTagListEvent>.broadcast();
  Stream<ImageTagListEvent> get eventStream => _eventController.stream;

  Future<void> loadUserTags() async {
    try {
      _state = _state.copyWith(loading: true);
      notifyListeners();
      final userTags = await _imageRepository.loadUserTags();
      _state = _state.copyWith(tags: userTags);
    } on Exception catch (err) {
      _eventController.sink.add(ImageTagListEvent.error(err.toString()));
    } finally {
      _state = _state.copyWith(loading: false);
      notifyListeners();
    }
  }

  Future<List<AppImageItem>?> getImageThumbnailList() async {
    try {
      _state = _state.copyWith(loading: true);
      notifyListeners();
    } on Exception catch (err) {
      _eventController.sink.add(ImageTagListEvent.error(err.toString()));
    } finally {
      _state = _state.copyWith(loading: false);
      notifyListeners();
    }
  }
}
