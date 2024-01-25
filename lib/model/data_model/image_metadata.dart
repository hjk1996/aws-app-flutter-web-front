
import 'package:flutter_web/utils/serializers/timestamp_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'image_metadata.freezed.dart';
part 'image_metadata.g.dart';


@freezed
class ImageMetadata with _$ImageMetadata {
  factory ImageMetadata({
  required int id,
    required String userId,
    required String imageName,
    required bool bookmark,
    @TimestampSerializer() required DateTime createdAt,

  }) = _ImageMetadata;
  factory ImageMetadata.fromJson(Map<String, dynamic> json) =>
    _$ImageMetadataFromJson(json);
}