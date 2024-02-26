// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueryRequestImpl _$$QueryRequestImplFromJson(Map<String, dynamic> json) =>
    _$QueryRequestImpl(
      query: json['query'] as String,
      queryType: $enumDecode(_$QueryTypeEnumMap, json['queryType']),
      createdAt: _datetimeFromJson(json['created_at']),
    );

Map<String, dynamic> _$$QueryRequestImplToJson(_$QueryRequestImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'queryType': _$QueryTypeEnumMap[instance.queryType]!,
      'created_at': _datetimeToJson(instance.createdAt),
    };

const _$QueryTypeEnumMap = {
  QueryType.normal: 'normal',
  QueryType.semantic: 'semantic',
};
