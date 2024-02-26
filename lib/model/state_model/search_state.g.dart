// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchStateImpl _$$SearchStateImplFromJson(Map<String, dynamic> json) =>
    _$SearchStateImpl(
      loading: json['loading'] as bool,
      showQueryTypes: json['showQueryTypes'] as bool,
      queryType: $enumDecode(_$QueryTypeEnumMap, json['queryType']),
      chatList: json['chatList'] as List<dynamic>,
    );

Map<String, dynamic> _$$SearchStateImplToJson(_$SearchStateImpl instance) =>
    <String, dynamic>{
      'loading': instance.loading,
      'showQueryTypes': instance.showQueryTypes,
      'queryType': _$QueryTypeEnumMap[instance.queryType]!,
      'chatList': instance.chatList,
    };

const _$QueryTypeEnumMap = {
  QueryType.normal: 'normal',
  QueryType.semantic: 'semantic',
};
