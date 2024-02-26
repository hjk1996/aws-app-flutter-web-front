import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_search_state.freezed.dart';


@freezed
class FaceSearchState with _$FaceSearchState {
  factory FaceSearchState({
    required bool loading,
    List<AppImageItem>? searchResult,
  }) = _FaceSearchState;
}
