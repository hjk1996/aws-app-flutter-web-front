import 'package:flutter_web/model/data_model/image_metadata.dart';
import 'package:flutter_web/model/state_model/image_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_item.freezed.dart';

@freezed
class ImageItem with _$ImageItem {
  factory ImageItem({
    required ImageMetadata imageMetadata,
    required ImageData imageData,
  }) = _ImageItem;
}
