// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueryResponseImpl _$$QueryResponseImplFromJson(Map<String, dynamic> json) =>
    _$QueryResponseImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$QueryResponseImplToJson(_$QueryResponseImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'imageUrls': instance.imageUrls,
    };
