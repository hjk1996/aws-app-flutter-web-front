// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_image_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppImageMetadataImpl _$$AppImageMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$AppImageMetadataImpl(
      pictureId: json['picture_id'] as int,
      userId: json['user_id'] as String,
      imageUrl: json['image_url'] as String,
      bookmarked: _bookmarkedFromJson(json['bookmarked'] as int?),
      createdAt: _datetimeFromJson(json['created_at']),
    );

Map<String, dynamic> _$$AppImageMetadataImplToJson(
        _$AppImageMetadataImpl instance) =>
    <String, dynamic>{
      'picture_id': instance.pictureId,
      'user_id': instance.userId,
      'image_url': instance.imageUrl,
      'bookmarked': _bookmarkedToJson(instance.bookmarked),
      'created_at': _datetimeToJson(instance.createdAt),
    };
