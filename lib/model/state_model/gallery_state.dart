import 'package:flutter_web/model/data_model/image_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_state.freezed.dart';

@freezed
class GalleryState with _$GalleryState {
  GalleryState._();
  factory GalleryState({
    required bool loading,
    required List<ImageMetadata> imageMetadataList,
    required bool selectedMode,
    required int totalPage,
    required int currentPage,
    int? currentImageIndex,
  }) = _GalleryState;
}
