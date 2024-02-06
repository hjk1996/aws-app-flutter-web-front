import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_image_data.freezed.dart';


@freezed
class AppImageData with _$AppImageData {
  factory AppImageData({
    required bool selected,
     Uint8List? thumbnail,
     Uint8List? original,
  }) = _AppImageData;
 
}
