import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web/event/search_event.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/repository/search_repository.dart';
import 'package:flutter_web/model/state_model/search_state.dart';

class SearchProvider extends ChangeNotifier {
  SearchProvider({
    required this.imageRepository,
    required this.searchRepository,
    required SearchState initialState,
  }) : _state = initialState;

  final ImageRepository imageRepository;
  final SearchRepository searchRepository;
  late SearchState _state;
  final StreamController<SearchEvent> _eventController =
      StreamController<SearchEvent>.broadcast();
  Stream<SearchEvent> get eventStream => _eventController.stream;
  SearchState get state => _state;

  void toggleShowQueryTypes() {
    _state = _state.copyWith(showQueryTypes: !_state.showQueryTypes);
    notifyListeners();
  }



  void setQueryType(QueryType queryType) {
    _state = _state.copyWith(
      queryType: queryType,
      showQueryTypes: false,
    );
    notifyListeners();
  }
}
