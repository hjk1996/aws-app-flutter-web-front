


import 'package:freezed_annotation/freezed_annotation.dart';


part 'search_state.freezed.dart';
part 'search_state.g.dart';




enum QueryType {
  normal,
  semantic
}

@freezed
class SearchState with _$SearchState {
  factory SearchState({
    required bool loading,
    required bool showQueryTypes,
    required QueryType queryType,
    required List<dynamic> chatList,

  }) = _SearchState;
  factory SearchState.fromJson(Map<String, dynamic> json) =>
    _$SearchStateFromJson(json);
}
