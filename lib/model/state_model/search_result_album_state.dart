import 'package:freezed_annotation/freezed_annotation.dart';


part 'search_result_album_state.freezed.dart';
part 'search_result_album_state.g.dart';


@freezed
class SearchResultAlbumState with _$SearchResultAlbumState {
  factory SearchResultAlbumState({
    required bool loading,
    int? currentImageIndex,
  }) = _SearchResultAlbumState;
  factory SearchResultAlbumState.fromJson(Map<String, dynamic> json) =>
    _$SearchResultAlbumStateFromJson(json);
}