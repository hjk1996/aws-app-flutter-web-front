import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_image_item.freezed.dart';

@freezed
class AppImageItem with _$AppImageItem {
  factory AppImageItem({
    required AppImageMetadata imageMetadata,
    required AppImageData imageData,
  }) = _AppImageItem;
}
