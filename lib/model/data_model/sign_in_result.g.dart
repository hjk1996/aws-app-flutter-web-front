// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInResultImpl _$$SignInResultImplFromJson(Map<String, dynamic> json) =>
    _$SignInResultImpl(
      accessToken: json['accessToken'] as String,
      idToken: json['idToken'] as String,
      refreshToken: json['refreshToken'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$SignInResultImplToJson(_$SignInResultImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'idToken': instance.idToken,
      'refreshToken': instance.refreshToken,
      'username': instance.username,
    };
