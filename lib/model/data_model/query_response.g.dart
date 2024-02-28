// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueryResponseImpl _$$QueryResponseImplFromJson(Map<String, dynamic> json) =>
    _$QueryResponseImpl(
      createdAt: _datetimeFromJson(json['created_at']),
      queryType: $enumDecode(_$QueryTypeEnumMap, json['queryType']),
      imageMetadataList: (json['imageMetadataList'] as List<dynamic>)
          .map((e) => AppImageMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QueryResponseImplToJson(_$QueryResponseImpl instance) =>
    <String, dynamic>{
      'created_at': _datetimeToJson(instance.createdAt),
      'queryType': _$QueryTypeEnumMap[instance.queryType]!,
      'imageMetadataList': instance.imageMetadataList,
    };

const _$QueryTypeEnumMap = {
  QueryType.normal: 'normal',
  QueryType.semantic: 'semantic',
};
