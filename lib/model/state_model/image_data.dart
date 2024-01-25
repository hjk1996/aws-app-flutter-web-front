import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_data.freezed.dart';

@freezed
class ImageData with _$ImageData {
  factory ImageData({
    required bool selected,
    Uint8List? thumbnail,
    Uint8List? original,
  }) = _ImageData;
}
