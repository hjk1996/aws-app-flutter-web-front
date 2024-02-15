// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onSignInSuccess,
    required TResult Function() onConfirmUserSuccess,
    required TResult Function() confirmSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onSignUpSuccess,
    TResult? Function()? onSignInSuccess,
    TResult? Function()? onConfirmUserSuccess,
    TResult? Function()? confirmSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onSignInSuccess,
    TResult Function()? onConfirmUserSuccess,
    TResult Function()? confirmSignUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventError value) error,
    required TResult Function(AuthEventLoading value) loading,
    required TResult Function(AuthEventtLoaded value) loaded,
    required TResult Function(AuthEventSignUpSuccess value) onSignUpSuccess,
    required TResult Function(AuthEventSignInSuccess value) onSignInSuccess,
    required TResult Function(AuthEventConfirmUserSuccess value)
        onConfirmUserSuccess,
    required TResult Function(AuthEventConfirmSignUp value) confirmSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventError value)? error,
    TResult? Function(AuthEventLoading value)? loading,
    TResult? Function(AuthEventtLoaded value)? loaded,
    TResult? Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult? Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult? Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult? Function(AuthEventConfirmSignUp value)? confirmSignUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventError value)? error,
    TResult Function(AuthEventLoading value)? loading,
    TResult Function(AuthEventtLoaded value)? loaded,
    TResult Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult Function(AuthEventConfirmSignUp value)? confirmSignUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthEventErrorImplCopyWith<$Res> {
  factory _$$AuthEventErrorImplCopyWith(_$AuthEventErrorImpl value,
          $Res Function(_$AuthEventErrorImpl) then) =
      __$$AuthEventErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String e});
}

/// @nodoc
class __$$AuthEventErrorImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventErrorImpl>
    implements _$$AuthEventErrorImplCopyWith<$Res> {
  __$$AuthEventErrorImplCopyWithImpl(
      _$AuthEventErrorImpl _value, $Res Function(_$AuthEventErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$AuthEventErrorImpl(
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthEventErrorImpl
    with DiagnosticableTreeMixin
    implements AuthEventError {
  const _$AuthEventErrorImpl(this.e);

  @override
  final String e;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.error(e: $e)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.error'))
      ..add(DiagnosticsProperty('e', e));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventErrorImpl &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventErrorImplCopyWith<_$AuthEventErrorImpl> get copyWith =>
      __$$AuthEventErrorImplCopyWithImpl<_$AuthEventErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onSignInSuccess,
    required TResult Function() onConfirmUserSuccess,
    required TResult Function() confirmSignUp,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onSignUpSuccess,
    TResult? Function()? onSignInSuccess,
    TResult? Function()? onConfirmUserSuccess,
    TResult? Function()? confirmSignUp,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onSignInSuccess,
    TResult Function()? onConfirmUserSuccess,
    TResult Function()? confirmSignUp,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventError value) error,
    required TResult Function(AuthEventLoading value) loading,
    required TResult Function(AuthEventtLoaded value) loaded,
    required TResult Function(AuthEventSignUpSuccess value) onSignUpSuccess,
    required TResult Function(AuthEventSignInSuccess value) onSignInSuccess,
    required TResult Function(AuthEventConfirmUserSuccess value)
        onConfirmUserSuccess,
    required TResult Function(AuthEventConfirmSignUp value) confirmSignUp,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventError value)? error,
    TResult? Function(AuthEventLoading value)? loading,
    TResult? Function(AuthEventtLoaded value)? loaded,
    TResult? Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult? Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult? Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult? Function(AuthEventConfirmSignUp value)? confirmSignUp,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventError value)? error,
    TResult Function(AuthEventLoading value)? loading,
    TResult Function(AuthEventtLoaded value)? loaded,
    TResult Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult Function(AuthEventConfirmSignUp value)? confirmSignUp,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthEventError implements AuthEvent {
  const factory AuthEventError(final String e) = _$AuthEventErrorImpl;

  String get e;
  @JsonKey(ignore: true)
  _$$AuthEventErrorImplCopyWith<_$AuthEventErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventLoadingImplCopyWith<$Res> {
  factory _$$AuthEventLoadingImplCopyWith(_$AuthEventLoadingImpl value,
          $Res Function(_$AuthEventLoadingImpl) then) =
      __$$AuthEventLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventLoadingImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventLoadingImpl>
    implements _$$AuthEventLoadingImplCopyWith<$Res> {
  __$$AuthEventLoadingImplCopyWithImpl(_$AuthEventLoadingImpl _value,
      $Res Function(_$AuthEventLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthEventLoadingImpl
    with DiagnosticableTreeMixin
    implements AuthEventLoading {
  const _$AuthEventLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvent.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthEventLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onSignInSuccess,
    required TResult Function() onConfirmUserSuccess,
    required TResult Function() confirmSignUp,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onSignUpSuccess,
    TResult? Function()? onSignInSuccess,
    TResult? Function()? onConfirmUserSuccess,
    TResult? Function()? confirmSignUp,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onSignInSuccess,
    TResult Function()? onConfirmUserSuccess,
    TResult Function()? confirmSignUp,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventError value) error,
    required TResult Function(AuthEventLoading value) loading,
    required TResult Function(AuthEventtLoaded value) loaded,
    required TResult Function(AuthEventSignUpSuccess value) onSignUpSuccess,
    required TResult Function(AuthEventSignInSuccess value) onSignInSuccess,
    required TResult Function(AuthEventConfirmUserSuccess value)
        onConfirmUserSuccess,
    required TResult Function(AuthEventConfirmSignUp value) confirmSignUp,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventError value)? error,
    TResult? Function(AuthEventLoading value)? loading,
    TResult? Function(AuthEventtLoaded value)? loaded,
    TResult? Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult? Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult? Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult? Function(AuthEventConfirmSignUp value)? confirmSignUp,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventError value)? error,
    TResult Function(AuthEventLoading value)? loading,
    TResult Function(AuthEventtLoaded value)? loaded,
    TResult Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult Function(AuthEventConfirmSignUp value)? confirmSignUp,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthEventLoading implements AuthEvent {
  const factory AuthEventLoading() = _$AuthEventLoadingImpl;
}

/// @nodoc
abstract class _$$AuthEventtLoadedImplCopyWith<$Res> {
  factory _$$AuthEventtLoadedImplCopyWith(_$AuthEventtLoadedImpl value,
          $Res Function(_$AuthEventtLoadedImpl) then) =
      __$$AuthEventtLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventtLoadedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventtLoadedImpl>
    implements _$$AuthEventtLoadedImplCopyWith<$Res> {
  __$$AuthEventtLoadedImplCopyWithImpl(_$AuthEventtLoadedImpl _value,
      $Res Function(_$AuthEventtLoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthEventtLoadedImpl
    with DiagnosticableTreeMixin
    implements AuthEventtLoaded {
  const _$AuthEventtLoadedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.loaded()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvent.loaded'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthEventtLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onSignInSuccess,
    required TResult Function() onConfirmUserSuccess,
    required TResult Function() confirmSignUp,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onSignUpSuccess,
    TResult? Function()? onSignInSuccess,
    TResult? Function()? onConfirmUserSuccess,
    TResult? Function()? confirmSignUp,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onSignInSuccess,
    TResult Function()? onConfirmUserSuccess,
    TResult Function()? confirmSignUp,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventError value) error,
    required TResult Function(AuthEventLoading value) loading,
    required TResult Function(AuthEventtLoaded value) loaded,
    required TResult Function(AuthEventSignUpSuccess value) onSignUpSuccess,
    required TResult Function(AuthEventSignInSuccess value) onSignInSuccess,
    required TResult Function(AuthEventConfirmUserSuccess value)
        onConfirmUserSuccess,
    required TResult Function(AuthEventConfirmSignUp value) confirmSignUp,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventError value)? error,
    TResult? Function(AuthEventLoading value)? loading,
    TResult? Function(AuthEventtLoaded value)? loaded,
    TResult? Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult? Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult? Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult? Function(AuthEventConfirmSignUp value)? confirmSignUp,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventError value)? error,
    TResult Function(AuthEventLoading value)? loading,
    TResult Function(AuthEventtLoaded value)? loaded,
    TResult Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult Function(AuthEventConfirmSignUp value)? confirmSignUp,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AuthEventtLoaded implements AuthEvent {
  const factory AuthEventtLoaded() = _$AuthEventtLoadedImpl;
}

/// @nodoc
abstract class _$$AuthEventSignUpSuccessImplCopyWith<$Res> {
  factory _$$AuthEventSignUpSuccessImplCopyWith(
          _$AuthEventSignUpSuccessImpl value,
          $Res Function(_$AuthEventSignUpSuccessImpl) then) =
      __$$AuthEventSignUpSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventSignUpSuccessImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventSignUpSuccessImpl>
    implements _$$AuthEventSignUpSuccessImplCopyWith<$Res> {
  __$$AuthEventSignUpSuccessImplCopyWithImpl(
      _$AuthEventSignUpSuccessImpl _value,
      $Res Function(_$AuthEventSignUpSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthEventSignUpSuccessImpl
    with DiagnosticableTreeMixin
    implements AuthEventSignUpSuccess {
  const _$AuthEventSignUpSuccessImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.onSignUpSuccess()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvent.onSignUpSuccess'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventSignUpSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onSignInSuccess,
    required TResult Function() onConfirmUserSuccess,
    required TResult Function() confirmSignUp,
  }) {
    return onSignUpSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onSignUpSuccess,
    TResult? Function()? onSignInSuccess,
    TResult? Function()? onConfirmUserSuccess,
    TResult? Function()? confirmSignUp,
  }) {
    return onSignUpSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onSignInSuccess,
    TResult Function()? onConfirmUserSuccess,
    TResult Function()? confirmSignUp,
    required TResult orElse(),
  }) {
    if (onSignUpSuccess != null) {
      return onSignUpSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventError value) error,
    required TResult Function(AuthEventLoading value) loading,
    required TResult Function(AuthEventtLoaded value) loaded,
    required TResult Function(AuthEventSignUpSuccess value) onSignUpSuccess,
    required TResult Function(AuthEventSignInSuccess value) onSignInSuccess,
    required TResult Function(AuthEventConfirmUserSuccess value)
        onConfirmUserSuccess,
    required TResult Function(AuthEventConfirmSignUp value) confirmSignUp,
  }) {
    return onSignUpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventError value)? error,
    TResult? Function(AuthEventLoading value)? loading,
    TResult? Function(AuthEventtLoaded value)? loaded,
    TResult? Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult? Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult? Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult? Function(AuthEventConfirmSignUp value)? confirmSignUp,
  }) {
    return onSignUpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventError value)? error,
    TResult Function(AuthEventLoading value)? loading,
    TResult Function(AuthEventtLoaded value)? loaded,
    TResult Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult Function(AuthEventConfirmSignUp value)? confirmSignUp,
    required TResult orElse(),
  }) {
    if (onSignUpSuccess != null) {
      return onSignUpSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthEventSignUpSuccess implements AuthEvent {
  const factory AuthEventSignUpSuccess() = _$AuthEventSignUpSuccessImpl;
}

/// @nodoc
abstract class _$$AuthEventSignInSuccessImplCopyWith<$Res> {
  factory _$$AuthEventSignInSuccessImplCopyWith(
          _$AuthEventSignInSuccessImpl value,
          $Res Function(_$AuthEventSignInSuccessImpl) then) =
      __$$AuthEventSignInSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventSignInSuccessImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventSignInSuccessImpl>
    implements _$$AuthEventSignInSuccessImplCopyWith<$Res> {
  __$$AuthEventSignInSuccessImplCopyWithImpl(
      _$AuthEventSignInSuccessImpl _value,
      $Res Function(_$AuthEventSignInSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthEventSignInSuccessImpl
    with DiagnosticableTreeMixin
    implements AuthEventSignInSuccess {
  const _$AuthEventSignInSuccessImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.onSignInSuccess()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvent.onSignInSuccess'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventSignInSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onSignInSuccess,
    required TResult Function() onConfirmUserSuccess,
    required TResult Function() confirmSignUp,
  }) {
    return onSignInSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onSignUpSuccess,
    TResult? Function()? onSignInSuccess,
    TResult? Function()? onConfirmUserSuccess,
    TResult? Function()? confirmSignUp,
  }) {
    return onSignInSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onSignInSuccess,
    TResult Function()? onConfirmUserSuccess,
    TResult Function()? confirmSignUp,
    required TResult orElse(),
  }) {
    if (onSignInSuccess != null) {
      return onSignInSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventError value) error,
    required TResult Function(AuthEventLoading value) loading,
    required TResult Function(AuthEventtLoaded value) loaded,
    required TResult Function(AuthEventSignUpSuccess value) onSignUpSuccess,
    required TResult Function(AuthEventSignInSuccess value) onSignInSuccess,
    required TResult Function(AuthEventConfirmUserSuccess value)
        onConfirmUserSuccess,
    required TResult Function(AuthEventConfirmSignUp value) confirmSignUp,
  }) {
    return onSignInSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventError value)? error,
    TResult? Function(AuthEventLoading value)? loading,
    TResult? Function(AuthEventtLoaded value)? loaded,
    TResult? Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult? Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult? Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult? Function(AuthEventConfirmSignUp value)? confirmSignUp,
  }) {
    return onSignInSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventError value)? error,
    TResult Function(AuthEventLoading value)? loading,
    TResult Function(AuthEventtLoaded value)? loaded,
    TResult Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult Function(AuthEventConfirmSignUp value)? confirmSignUp,
    required TResult orElse(),
  }) {
    if (onSignInSuccess != null) {
      return onSignInSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthEventSignInSuccess implements AuthEvent {
  const factory AuthEventSignInSuccess() = _$AuthEventSignInSuccessImpl;
}

/// @nodoc
abstract class _$$AuthEventConfirmUserSuccessImplCopyWith<$Res> {
  factory _$$AuthEventConfirmUserSuccessImplCopyWith(
          _$AuthEventConfirmUserSuccessImpl value,
          $Res Function(_$AuthEventConfirmUserSuccessImpl) then) =
      __$$AuthEventConfirmUserSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventConfirmUserSuccessImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventConfirmUserSuccessImpl>
    implements _$$AuthEventConfirmUserSuccessImplCopyWith<$Res> {
  __$$AuthEventConfirmUserSuccessImplCopyWithImpl(
      _$AuthEventConfirmUserSuccessImpl _value,
      $Res Function(_$AuthEventConfirmUserSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthEventConfirmUserSuccessImpl
    with DiagnosticableTreeMixin
    implements AuthEventConfirmUserSuccess {
  const _$AuthEventConfirmUserSuccessImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.onConfirmUserSuccess()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AuthEvent.onConfirmUserSuccess'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventConfirmUserSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onSignInSuccess,
    required TResult Function() onConfirmUserSuccess,
    required TResult Function() confirmSignUp,
  }) {
    return onConfirmUserSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onSignUpSuccess,
    TResult? Function()? onSignInSuccess,
    TResult? Function()? onConfirmUserSuccess,
    TResult? Function()? confirmSignUp,
  }) {
    return onConfirmUserSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onSignInSuccess,
    TResult Function()? onConfirmUserSuccess,
    TResult Function()? confirmSignUp,
    required TResult orElse(),
  }) {
    if (onConfirmUserSuccess != null) {
      return onConfirmUserSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventError value) error,
    required TResult Function(AuthEventLoading value) loading,
    required TResult Function(AuthEventtLoaded value) loaded,
    required TResult Function(AuthEventSignUpSuccess value) onSignUpSuccess,
    required TResult Function(AuthEventSignInSuccess value) onSignInSuccess,
    required TResult Function(AuthEventConfirmUserSuccess value)
        onConfirmUserSuccess,
    required TResult Function(AuthEventConfirmSignUp value) confirmSignUp,
  }) {
    return onConfirmUserSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventError value)? error,
    TResult? Function(AuthEventLoading value)? loading,
    TResult? Function(AuthEventtLoaded value)? loaded,
    TResult? Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult? Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult? Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult? Function(AuthEventConfirmSignUp value)? confirmSignUp,
  }) {
    return onConfirmUserSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventError value)? error,
    TResult Function(AuthEventLoading value)? loading,
    TResult Function(AuthEventtLoaded value)? loaded,
    TResult Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult Function(AuthEventConfirmSignUp value)? confirmSignUp,
    required TResult orElse(),
  }) {
    if (onConfirmUserSuccess != null) {
      return onConfirmUserSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthEventConfirmUserSuccess implements AuthEvent {
  const factory AuthEventConfirmUserSuccess() =
      _$AuthEventConfirmUserSuccessImpl;
}

/// @nodoc
abstract class _$$AuthEventConfirmSignUpImplCopyWith<$Res> {
  factory _$$AuthEventConfirmSignUpImplCopyWith(
          _$AuthEventConfirmSignUpImpl value,
          $Res Function(_$AuthEventConfirmSignUpImpl) then) =
      __$$AuthEventConfirmSignUpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventConfirmSignUpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventConfirmSignUpImpl>
    implements _$$AuthEventConfirmSignUpImplCopyWith<$Res> {
  __$$AuthEventConfirmSignUpImplCopyWithImpl(
      _$AuthEventConfirmSignUpImpl _value,
      $Res Function(_$AuthEventConfirmSignUpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthEventConfirmSignUpImpl
    with DiagnosticableTreeMixin
    implements AuthEventConfirmSignUp {
  const _$AuthEventConfirmSignUpImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.confirmSignUp()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvent.confirmSignUp'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventConfirmSignUpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onSignInSuccess,
    required TResult Function() onConfirmUserSuccess,
    required TResult Function() confirmSignUp,
  }) {
    return confirmSignUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onSignUpSuccess,
    TResult? Function()? onSignInSuccess,
    TResult? Function()? onConfirmUserSuccess,
    TResult? Function()? confirmSignUp,
  }) {
    return confirmSignUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onSignInSuccess,
    TResult Function()? onConfirmUserSuccess,
    TResult Function()? confirmSignUp,
    required TResult orElse(),
  }) {
    if (confirmSignUp != null) {
      return confirmSignUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventError value) error,
    required TResult Function(AuthEventLoading value) loading,
    required TResult Function(AuthEventtLoaded value) loaded,
    required TResult Function(AuthEventSignUpSuccess value) onSignUpSuccess,
    required TResult Function(AuthEventSignInSuccess value) onSignInSuccess,
    required TResult Function(AuthEventConfirmUserSuccess value)
        onConfirmUserSuccess,
    required TResult Function(AuthEventConfirmSignUp value) confirmSignUp,
  }) {
    return confirmSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventError value)? error,
    TResult? Function(AuthEventLoading value)? loading,
    TResult? Function(AuthEventtLoaded value)? loaded,
    TResult? Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult? Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult? Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult? Function(AuthEventConfirmSignUp value)? confirmSignUp,
  }) {
    return confirmSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventError value)? error,
    TResult Function(AuthEventLoading value)? loading,
    TResult Function(AuthEventtLoaded value)? loaded,
    TResult Function(AuthEventSignUpSuccess value)? onSignUpSuccess,
    TResult Function(AuthEventSignInSuccess value)? onSignInSuccess,
    TResult Function(AuthEventConfirmUserSuccess value)? onConfirmUserSuccess,
    TResult Function(AuthEventConfirmSignUp value)? confirmSignUp,
    required TResult orElse(),
  }) {
    if (confirmSignUp != null) {
      return confirmSignUp(this);
    }
    return orElse();
  }
}

abstract class AuthEventConfirmSignUp implements AuthEvent {
  const factory AuthEventConfirmSignUp() = _$AuthEventConfirmSignUpImpl;
}
