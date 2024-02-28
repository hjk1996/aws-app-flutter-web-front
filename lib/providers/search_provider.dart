import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/event/search_event.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/data_model/query_request.dart';
import 'package:flutter_web/model/data_model/query_response.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/repository/search_repository.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
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

  Future<void> hanldleQuery({
    required String query,
  }) async {
    switch (_state.queryType) {
      case QueryType.semantic:
        await semanticSearch(query: query);
        break;
      case QueryType.normal:
        break;
      default:
        break;
    }
  }

  Future<void> semanticSearch({
    required String query,
  }) async {
    try {
      print('searching for $query');
      _state = _state.copyWith(loading: true);
      _state = _state.copyWith(
        chatList: [
          ..._state.chatList,
          QueryRequest(
              query: query,
              queryType: QueryType.semantic,
              createdAt: DateTime.now()),
        ],
      );
      notifyListeners();
      final result = await searchRepository.semanticSearch(query: query);
      _state = _state.copyWith(
        chatList: [
          ..._state.chatList,
          QueryResponse(
            createdAt: DateTime.now(),
            queryType: QueryType.semantic,
            imageMetadataList: result,
          ),
        ],
      );
    } on DioException catch (err) {
      _eventController.add(SearchEvent.error(err.toString()));
    } on Exception catch (err) {
      _eventController.add(SearchEvent.error(err.toString()));
    } finally {
      _state = _state.copyWith(loading: false);
      notifyListeners();
    }
  }

  Future<List<AppImageItem>?> getImageThumbnailList({
    required List<AppImageMetadata> imageMetadataList,
  }) async {
    try {
      _state = _state.copyWith(loading: true);
      notifyListeners();
      final thumbnailImageDataList = await imageRepository.getImageDataList(
        imageUrls: imageMetadataList.map((e) => e.imageUrl).toList(),
        isThumbnail: true,
      );

      if (thumbnailImageDataList == null) {
        _state = _state.copyWith(loading: false);
        notifyListeners();
        return [];
      }

      final imageItemList = List.generate(
        imageMetadataList.length,
        (index) => AppImageItem(
          imageMetadata: imageMetadataList[index],
          imageData: thumbnailImageDataList[index],
        ),
      );
      _state = _state.copyWith(loading: false);
      notifyListeners();
      return imageItemList;
    } on DioException catch (err) {
      _eventController.add(SearchEvent.error(err.toString()));
      notifyListeners();
      return null;
    } on Exception catch (err) {
      _eventController.add(SearchEvent.error(err.toString()));
      notifyListeners();
      return null;
    }
  }
}
