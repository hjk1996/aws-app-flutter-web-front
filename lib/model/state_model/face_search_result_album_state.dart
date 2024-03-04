import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_search_result_album_state.freezed.dart';
part 'face_search_result_album_state.g.dart';

@freezed
class FaceSearchResultAlbumState with _$FaceSearchResultAlbumState {
  factory FaceSearchResultAlbumState({
    required bool loading,
    int? currentImageIndex,
  }) = _FaceSearchResultAlbumState;
  factory FaceSearchResultAlbumState.fromJson(Map<String, dynamic> json) =>
      _$FaceSearchResultAlbumStateFromJson(json);
}
