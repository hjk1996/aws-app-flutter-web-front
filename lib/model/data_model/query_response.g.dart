// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueryResponseImpl _$$QueryResponseImplFromJson(Map<String, dynamic> json) =>
    _$QueryResponseImpl(
      createdAt: _datetimeFromJson(json['created_at']),
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$QueryResponseImplToJson(_$QueryResponseImpl instance) =>
    <String, dynamic>{
      'created_at': _datetimeToJson(instance.createdAt),
      'imageUrls': instance.imageUrls,
    };
