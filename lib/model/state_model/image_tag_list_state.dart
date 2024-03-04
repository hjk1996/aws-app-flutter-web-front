

import 'package:flutter_web/model/data_model/tag_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'image_tag_list_state.freezed.dart';
part 'image_tag_list_state.g.dart';


@freezed
class ImageTagListState with _$ImageTagListState {
  factory ImageTagListState({
    required bool loading,
    required List<TagInfo> tags,
  }) = _ImageTagListState;
  factory ImageTagListState.fromJson(Map<String, dynamic> json) =>
    _$ImageTagListStateFromJson(json);
}