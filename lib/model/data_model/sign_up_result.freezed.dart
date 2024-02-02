// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpResult _$SignUpResultFromJson(Map<String, dynamic> json) {
  return _SignUpResult.fromJson(json);
}

/// @nodoc
mixin _$SignUpResult {
  String get username => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpResultCopyWith<SignUpResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpResultCopyWith<$Res> {
  factory $SignUpResultCopyWith(
          SignUpResult value, $Res Function(SignUpResult) then) =
      _$SignUpResultCopyWithImpl<$Res, SignUpResult>;
  @useResult
  $Res call({String username, String id, bool success});
}

/// @nodoc
class _$SignUpResultCopyWithImpl<$Res, $Val extends SignUpResult>
    implements $SignUpResultCopyWith<$Res> {
  _$SignUpResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? id = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpResultImplCopyWith<$Res>
    implements $SignUpResultCopyWith<$Res> {
  factory _$$SignUpResultImplCopyWith(
          _$SignUpResultImpl value, $Res Function(_$SignUpResultImpl) then) =
      __$$SignUpResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String id, bool success});
}

/// @nodoc
class __$$SignUpResultImplCopyWithImpl<$Res>
    extends _$SignUpResultCopyWithImpl<$Res, _$SignUpResultImpl>
    implements _$$SignUpResultImplCopyWith<$Res> {
  __$$SignUpResultImplCopyWithImpl(
      _$SignUpResultImpl _value, $Res Function(_$SignUpResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? id = null,
    Object? success = null,
  }) {
    return _then(_$SignUpResultImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpResultImpl implements _SignUpResult {
  _$SignUpResultImpl(
      {required this.username, required this.id, required this.success});

  factory _$SignUpResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpResultImplFromJson(json);

  @override
  final String username;
  @override
  final String id;
  @override
  final bool success;

  @override
  String toString() {
    return 'SignUpResult(username: $username, id: $id, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpResultImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, id, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpResultImplCopyWith<_$SignUpResultImpl> get copyWith =>
      __$$SignUpResultImplCopyWithImpl<_$SignUpResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpResultImplToJson(
      this,
    );
  }
}

abstract class _SignUpResult implements SignUpResult {
  factory _SignUpResult(
      {required final String username,
      required final String id,
      required final bool success}) = _$SignUpResultImpl;

  factory _SignUpResult.fromJson(Map<String, dynamic> json) =
      _$SignUpResultImpl.fromJson;

  @override
  String get username;
  @override
  String get id;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$SignUpResultImplCopyWith<_$SignUpResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
