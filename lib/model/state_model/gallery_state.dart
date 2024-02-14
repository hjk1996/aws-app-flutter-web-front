import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_state.freezed.dart';

@freezed
class GalleryState with _$GalleryState {
  GalleryState._();
  factory GalleryState({
    required bool loading,
    required int totalPage,
    required int currentPage,
    required bool selectMode,
    int? currentImageIndex,
  }) = _GalleryState;
}
