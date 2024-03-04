// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_tag_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageTagListStateImpl _$$ImageTagListStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageTagListStateImpl(
      loading: json['loading'] as bool,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ImageTagListStateImplToJson(
        _$ImageTagListStateImpl instance) =>
    <String, dynamic>{
      'loading': instance.loading,
      'tags': instance.tags,
    };
