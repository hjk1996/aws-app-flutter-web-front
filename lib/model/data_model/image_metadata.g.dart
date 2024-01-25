// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageMetadataImpl _$$ImageMetadataImplFromJson(Map<String, dynamic> json) =>
    _$ImageMetadataImpl(
      id: json['id'] as int,
      userId: json['userId'] as String,
      imageName: json['imageName'] as String,
      bookmark: json['bookmark'] as bool,
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$ImageMetadataImplToJson(_$ImageMetadataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'imageName': instance.imageName,
      'bookmark': instance.bookmark,
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
    };
