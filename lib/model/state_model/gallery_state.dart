import 'package:flutter_web/model/data_model/image_metadata.dart';
import 'package:flutter_web/model/state_model/image_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_state.freezed.dart';

@freezed
class GalleryState with _$GalleryState {
  GalleryState._();
  factory GalleryState({
    required List<ImageMetadata> imageMetadataList,
    required bool selectedMode,
    required int totalPage,
    required int currentPage,
    int? currentImageIndex,
  }) = _GalleryState;
}
