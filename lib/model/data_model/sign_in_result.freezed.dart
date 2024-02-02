// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInResult _$SignInResultFromJson(Map<String, dynamic> json) {
  return _SignInResult.fromJson(json);
}

/// @nodoc
mixin _$SignInResult {
  String get accessToken => throw _privateConstructorUsedError;
  String get idToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInResultCopyWith<SignInResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResultCopyWith<$Res> {
  factory $SignInResultCopyWith(
          SignInResult value, $Res Function(SignInResult) then) =
      _$SignInResultCopyWithImpl<$Res, SignInResult>;
  @useResult
  $Res call(
      {String accessToken,
      String idToken,
      String refreshToken,
      String username});
}

/// @nodoc
class _$SignInResultCopyWithImpl<$Res, $Val extends SignInResult>
    implements $SignInResultCopyWith<$Res> {
  _$SignInResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? idToken = null,
    Object? refreshToken = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInResultImplCopyWith<$Res>
    implements $SignInResultCopyWith<$Res> {
  factory _$$SignInResultImplCopyWith(
          _$SignInResultImpl value, $Res Function(_$SignInResultImpl) then) =
      __$$SignInResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String idToken,
      String refreshToken,
      String username});
}

/// @nodoc
class __$$SignInResultImplCopyWithImpl<$Res>
    extends _$SignInResultCopyWithImpl<$Res, _$SignInResultImpl>
    implements _$$SignInResultImplCopyWith<$Res> {
  __$$SignInResultImplCopyWithImpl(
      _$SignInResultImpl _value, $Res Function(_$SignInResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? idToken = null,
    Object? refreshToken = null,
    Object? username = null,
  }) {
    return _then(_$SignInResultImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInResultImpl implements _SignInResult {
  _$SignInResultImpl(
      {required this.accessToken,
      required this.idToken,
      required this.refreshToken,
      required this.username});

  factory _$SignInResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInResultImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String idToken;
  @override
  final String refreshToken;
  @override
  final String username;

  @override
  String toString() {
    return 'SignInResult(accessToken: $accessToken, idToken: $idToken, refreshToken: $refreshToken, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInResultImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, idToken, refreshToken, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInResultImplCopyWith<_$SignInResultImpl> get copyWith =>
      __$$SignInResultImplCopyWithImpl<_$SignInResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInResultImplToJson(
      this,
    );
  }
}

abstract class _SignInResult implements SignInResult {
  factory _SignInResult(
      {required final String accessToken,
      required final String idToken,
      required final String refreshToken,
      required final String username}) = _$SignInResultImpl;

  factory _SignInResult.fromJson(Map<String, dynamic> json) =
      _$SignInResultImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get idToken;
  @override
  String get refreshToken;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$SignInResultImplCopyWith<_$SignInResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
