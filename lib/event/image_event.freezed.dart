// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onImageUploadSuccess,
    required TResult Function() onImageDeleteSuccess,
    required TResult Function(Exception e) onImageDeleteFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Exception e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onImageUploadSuccess,
    TResult? Function()? onImageDeleteSuccess,
    TResult? Function(Exception e)? onImageDeleteFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onImageUploadSuccess,
    TResult Function()? onImageDeleteSuccess,
    TResult Function(Exception e)? onImageDeleteFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageEventError value) error,
    required TResult Function(ImageEventLoading value) loading,
    required TResult Function(ImageEventLoaded value) loaded,
    required TResult Function(ImageEventOnImageUploadSuccess value)
        onImageUploadSuccess,
    required TResult Function(ImageEventOnImageDeleteSuccess value)
        onImageDeleteSuccess,
    required TResult Function(ImageEventOnImageDeleteFailure value)
        onImageDeleteFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageEventError value)? error,
    TResult? Function(ImageEventLoading value)? loading,
    TResult? Function(ImageEventLoaded value)? loaded,
    TResult? Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult? Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult? Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageEventError value)? error,
    TResult Function(ImageEventLoading value)? loading,
    TResult Function(ImageEventLoaded value)? loaded,
    TResult Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageEventCopyWith<$Res> {
  factory $ImageEventCopyWith(
          ImageEvent value, $Res Function(ImageEvent) then) =
      _$ImageEventCopyWithImpl<$Res, ImageEvent>;
}

/// @nodoc
class _$ImageEventCopyWithImpl<$Res, $Val extends ImageEvent>
    implements $ImageEventCopyWith<$Res> {
  _$ImageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ImageEventErrorImplCopyWith<$Res> {
  factory _$$ImageEventErrorImplCopyWith(_$ImageEventErrorImpl value,
          $Res Function(_$ImageEventErrorImpl) then) =
      __$$ImageEventErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception e});
}

/// @nodoc
class __$$ImageEventErrorImplCopyWithImpl<$Res>
    extends _$ImageEventCopyWithImpl<$Res, _$ImageEventErrorImpl>
    implements _$$ImageEventErrorImplCopyWith<$Res> {
  __$$ImageEventErrorImplCopyWithImpl(
      _$ImageEventErrorImpl _value, $Res Function(_$ImageEventErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$ImageEventErrorImpl(
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$ImageEventErrorImpl implements ImageEventError {
  const _$ImageEventErrorImpl(this.e);

  @override
  final Exception e;

  @override
  String toString() {
    return 'ImageEvent.error(e: $e)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageEventErrorImpl &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageEventErrorImplCopyWith<_$ImageEventErrorImpl> get copyWith =>
      __$$ImageEventErrorImplCopyWithImpl<_$ImageEventErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onImageUploadSuccess,
    required TResult Function() onImageDeleteSuccess,
    required TResult Function(Exception e) onImageDeleteFailure,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Exception e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onImageUploadSuccess,
    TResult? Function()? onImageDeleteSuccess,
    TResult? Function(Exception e)? onImageDeleteFailure,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onImageUploadSuccess,
    TResult Function()? onImageDeleteSuccess,
    TResult Function(Exception e)? onImageDeleteFailure,
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
    required TResult Function(ImageEventError value) error,
    required TResult Function(ImageEventLoading value) loading,
    required TResult Function(ImageEventLoaded value) loaded,
    required TResult Function(ImageEventOnImageUploadSuccess value)
        onImageUploadSuccess,
    required TResult Function(ImageEventOnImageDeleteSuccess value)
        onImageDeleteSuccess,
    required TResult Function(ImageEventOnImageDeleteFailure value)
        onImageDeleteFailure,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageEventError value)? error,
    TResult? Function(ImageEventLoading value)? loading,
    TResult? Function(ImageEventLoaded value)? loaded,
    TResult? Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult? Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult? Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageEventError value)? error,
    TResult Function(ImageEventLoading value)? loading,
    TResult Function(ImageEventLoaded value)? loaded,
    TResult Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ImageEventError implements ImageEvent {
  const factory ImageEventError(final Exception e) = _$ImageEventErrorImpl;

  Exception get e;
  @JsonKey(ignore: true)
  _$$ImageEventErrorImplCopyWith<_$ImageEventErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageEventLoadingImplCopyWith<$Res> {
  factory _$$ImageEventLoadingImplCopyWith(_$ImageEventLoadingImpl value,
          $Res Function(_$ImageEventLoadingImpl) then) =
      __$$ImageEventLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImageEventLoadingImplCopyWithImpl<$Res>
    extends _$ImageEventCopyWithImpl<$Res, _$ImageEventLoadingImpl>
    implements _$$ImageEventLoadingImplCopyWith<$Res> {
  __$$ImageEventLoadingImplCopyWithImpl(_$ImageEventLoadingImpl _value,
      $Res Function(_$ImageEventLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ImageEventLoadingImpl implements ImageEventLoading {
  const _$ImageEventLoadingImpl();

  @override
  String toString() {
    return 'ImageEvent.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ImageEventLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onImageUploadSuccess,
    required TResult Function() onImageDeleteSuccess,
    required TResult Function(Exception e) onImageDeleteFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Exception e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onImageUploadSuccess,
    TResult? Function()? onImageDeleteSuccess,
    TResult? Function(Exception e)? onImageDeleteFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onImageUploadSuccess,
    TResult Function()? onImageDeleteSuccess,
    TResult Function(Exception e)? onImageDeleteFailure,
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
    required TResult Function(ImageEventError value) error,
    required TResult Function(ImageEventLoading value) loading,
    required TResult Function(ImageEventLoaded value) loaded,
    required TResult Function(ImageEventOnImageUploadSuccess value)
        onImageUploadSuccess,
    required TResult Function(ImageEventOnImageDeleteSuccess value)
        onImageDeleteSuccess,
    required TResult Function(ImageEventOnImageDeleteFailure value)
        onImageDeleteFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageEventError value)? error,
    TResult? Function(ImageEventLoading value)? loading,
    TResult? Function(ImageEventLoaded value)? loaded,
    TResult? Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult? Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult? Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageEventError value)? error,
    TResult Function(ImageEventLoading value)? loading,
    TResult Function(ImageEventLoaded value)? loaded,
    TResult Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ImageEventLoading implements ImageEvent {
  const factory ImageEventLoading() = _$ImageEventLoadingImpl;
}

/// @nodoc
abstract class _$$ImageEventLoadedImplCopyWith<$Res> {
  factory _$$ImageEventLoadedImplCopyWith(_$ImageEventLoadedImpl value,
          $Res Function(_$ImageEventLoadedImpl) then) =
      __$$ImageEventLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImageEventLoadedImplCopyWithImpl<$Res>
    extends _$ImageEventCopyWithImpl<$Res, _$ImageEventLoadedImpl>
    implements _$$ImageEventLoadedImplCopyWith<$Res> {
  __$$ImageEventLoadedImplCopyWithImpl(_$ImageEventLoadedImpl _value,
      $Res Function(_$ImageEventLoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ImageEventLoadedImpl implements ImageEventLoaded {
  const _$ImageEventLoadedImpl();

  @override
  String toString() {
    return 'ImageEvent.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ImageEventLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onImageUploadSuccess,
    required TResult Function() onImageDeleteSuccess,
    required TResult Function(Exception e) onImageDeleteFailure,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Exception e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onImageUploadSuccess,
    TResult? Function()? onImageDeleteSuccess,
    TResult? Function(Exception e)? onImageDeleteFailure,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onImageUploadSuccess,
    TResult Function()? onImageDeleteSuccess,
    TResult Function(Exception e)? onImageDeleteFailure,
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
    required TResult Function(ImageEventError value) error,
    required TResult Function(ImageEventLoading value) loading,
    required TResult Function(ImageEventLoaded value) loaded,
    required TResult Function(ImageEventOnImageUploadSuccess value)
        onImageUploadSuccess,
    required TResult Function(ImageEventOnImageDeleteSuccess value)
        onImageDeleteSuccess,
    required TResult Function(ImageEventOnImageDeleteFailure value)
        onImageDeleteFailure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageEventError value)? error,
    TResult? Function(ImageEventLoading value)? loading,
    TResult? Function(ImageEventLoaded value)? loaded,
    TResult? Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult? Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult? Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageEventError value)? error,
    TResult Function(ImageEventLoading value)? loading,
    TResult Function(ImageEventLoaded value)? loaded,
    TResult Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ImageEventLoaded implements ImageEvent {
  const factory ImageEventLoaded() = _$ImageEventLoadedImpl;
}

/// @nodoc
abstract class _$$ImageEventOnImageUploadSuccessImplCopyWith<$Res> {
  factory _$$ImageEventOnImageUploadSuccessImplCopyWith(
          _$ImageEventOnImageUploadSuccessImpl value,
          $Res Function(_$ImageEventOnImageUploadSuccessImpl) then) =
      __$$ImageEventOnImageUploadSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImageEventOnImageUploadSuccessImplCopyWithImpl<$Res>
    extends _$ImageEventCopyWithImpl<$Res, _$ImageEventOnImageUploadSuccessImpl>
    implements _$$ImageEventOnImageUploadSuccessImplCopyWith<$Res> {
  __$$ImageEventOnImageUploadSuccessImplCopyWithImpl(
      _$ImageEventOnImageUploadSuccessImpl _value,
      $Res Function(_$ImageEventOnImageUploadSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ImageEventOnImageUploadSuccessImpl
    implements ImageEventOnImageUploadSuccess {
  const _$ImageEventOnImageUploadSuccessImpl();

  @override
  String toString() {
    return 'ImageEvent.onImageUploadSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageEventOnImageUploadSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onImageUploadSuccess,
    required TResult Function() onImageDeleteSuccess,
    required TResult Function(Exception e) onImageDeleteFailure,
  }) {
    return onImageUploadSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Exception e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onImageUploadSuccess,
    TResult? Function()? onImageDeleteSuccess,
    TResult? Function(Exception e)? onImageDeleteFailure,
  }) {
    return onImageUploadSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onImageUploadSuccess,
    TResult Function()? onImageDeleteSuccess,
    TResult Function(Exception e)? onImageDeleteFailure,
    required TResult orElse(),
  }) {
    if (onImageUploadSuccess != null) {
      return onImageUploadSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageEventError value) error,
    required TResult Function(ImageEventLoading value) loading,
    required TResult Function(ImageEventLoaded value) loaded,
    required TResult Function(ImageEventOnImageUploadSuccess value)
        onImageUploadSuccess,
    required TResult Function(ImageEventOnImageDeleteSuccess value)
        onImageDeleteSuccess,
    required TResult Function(ImageEventOnImageDeleteFailure value)
        onImageDeleteFailure,
  }) {
    return onImageUploadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageEventError value)? error,
    TResult? Function(ImageEventLoading value)? loading,
    TResult? Function(ImageEventLoaded value)? loaded,
    TResult? Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult? Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult? Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
  }) {
    return onImageUploadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageEventError value)? error,
    TResult Function(ImageEventLoading value)? loading,
    TResult Function(ImageEventLoaded value)? loaded,
    TResult Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
    required TResult orElse(),
  }) {
    if (onImageUploadSuccess != null) {
      return onImageUploadSuccess(this);
    }
    return orElse();
  }
}

abstract class ImageEventOnImageUploadSuccess implements ImageEvent {
  const factory ImageEventOnImageUploadSuccess() =
      _$ImageEventOnImageUploadSuccessImpl;
}

/// @nodoc
abstract class _$$ImageEventOnImageDeleteSuccessImplCopyWith<$Res> {
  factory _$$ImageEventOnImageDeleteSuccessImplCopyWith(
          _$ImageEventOnImageDeleteSuccessImpl value,
          $Res Function(_$ImageEventOnImageDeleteSuccessImpl) then) =
      __$$ImageEventOnImageDeleteSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ImageEventOnImageDeleteSuccessImplCopyWithImpl<$Res>
    extends _$ImageEventCopyWithImpl<$Res, _$ImageEventOnImageDeleteSuccessImpl>
    implements _$$ImageEventOnImageDeleteSuccessImplCopyWith<$Res> {
  __$$ImageEventOnImageDeleteSuccessImplCopyWithImpl(
      _$ImageEventOnImageDeleteSuccessImpl _value,
      $Res Function(_$ImageEventOnImageDeleteSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ImageEventOnImageDeleteSuccessImpl
    implements ImageEventOnImageDeleteSuccess {
  const _$ImageEventOnImageDeleteSuccessImpl();

  @override
  String toString() {
    return 'ImageEvent.onImageDeleteSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageEventOnImageDeleteSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onImageUploadSuccess,
    required TResult Function() onImageDeleteSuccess,
    required TResult Function(Exception e) onImageDeleteFailure,
  }) {
    return onImageDeleteSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Exception e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onImageUploadSuccess,
    TResult? Function()? onImageDeleteSuccess,
    TResult? Function(Exception e)? onImageDeleteFailure,
  }) {
    return onImageDeleteSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onImageUploadSuccess,
    TResult Function()? onImageDeleteSuccess,
    TResult Function(Exception e)? onImageDeleteFailure,
    required TResult orElse(),
  }) {
    if (onImageDeleteSuccess != null) {
      return onImageDeleteSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageEventError value) error,
    required TResult Function(ImageEventLoading value) loading,
    required TResult Function(ImageEventLoaded value) loaded,
    required TResult Function(ImageEventOnImageUploadSuccess value)
        onImageUploadSuccess,
    required TResult Function(ImageEventOnImageDeleteSuccess value)
        onImageDeleteSuccess,
    required TResult Function(ImageEventOnImageDeleteFailure value)
        onImageDeleteFailure,
  }) {
    return onImageDeleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageEventError value)? error,
    TResult? Function(ImageEventLoading value)? loading,
    TResult? Function(ImageEventLoaded value)? loaded,
    TResult? Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult? Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult? Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
  }) {
    return onImageDeleteSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageEventError value)? error,
    TResult Function(ImageEventLoading value)? loading,
    TResult Function(ImageEventLoaded value)? loaded,
    TResult Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
    required TResult orElse(),
  }) {
    if (onImageDeleteSuccess != null) {
      return onImageDeleteSuccess(this);
    }
    return orElse();
  }
}

abstract class ImageEventOnImageDeleteSuccess implements ImageEvent {
  const factory ImageEventOnImageDeleteSuccess() =
      _$ImageEventOnImageDeleteSuccessImpl;
}

/// @nodoc
abstract class _$$ImageEventOnImageDeleteFailureImplCopyWith<$Res> {
  factory _$$ImageEventOnImageDeleteFailureImplCopyWith(
          _$ImageEventOnImageDeleteFailureImpl value,
          $Res Function(_$ImageEventOnImageDeleteFailureImpl) then) =
      __$$ImageEventOnImageDeleteFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception e});
}

/// @nodoc
class __$$ImageEventOnImageDeleteFailureImplCopyWithImpl<$Res>
    extends _$ImageEventCopyWithImpl<$Res, _$ImageEventOnImageDeleteFailureImpl>
    implements _$$ImageEventOnImageDeleteFailureImplCopyWith<$Res> {
  __$$ImageEventOnImageDeleteFailureImplCopyWithImpl(
      _$ImageEventOnImageDeleteFailureImpl _value,
      $Res Function(_$ImageEventOnImageDeleteFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$ImageEventOnImageDeleteFailureImpl(
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$ImageEventOnImageDeleteFailureImpl
    implements ImageEventOnImageDeleteFailure {
  const _$ImageEventOnImageDeleteFailureImpl(this.e);

  @override
  final Exception e;

  @override
  String toString() {
    return 'ImageEvent.onImageDeleteFailure(e: $e)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageEventOnImageDeleteFailureImpl &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageEventOnImageDeleteFailureImplCopyWith<
          _$ImageEventOnImageDeleteFailureImpl>
      get copyWith => __$$ImageEventOnImageDeleteFailureImplCopyWithImpl<
          _$ImageEventOnImageDeleteFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) error,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() onImageUploadSuccess,
    required TResult Function() onImageDeleteSuccess,
    required TResult Function(Exception e) onImageDeleteFailure,
  }) {
    return onImageDeleteFailure(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Exception e)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? onImageUploadSuccess,
    TResult? Function()? onImageDeleteSuccess,
    TResult? Function(Exception e)? onImageDeleteFailure,
  }) {
    return onImageDeleteFailure?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? onImageUploadSuccess,
    TResult Function()? onImageDeleteSuccess,
    TResult Function(Exception e)? onImageDeleteFailure,
    required TResult orElse(),
  }) {
    if (onImageDeleteFailure != null) {
      return onImageDeleteFailure(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageEventError value) error,
    required TResult Function(ImageEventLoading value) loading,
    required TResult Function(ImageEventLoaded value) loaded,
    required TResult Function(ImageEventOnImageUploadSuccess value)
        onImageUploadSuccess,
    required TResult Function(ImageEventOnImageDeleteSuccess value)
        onImageDeleteSuccess,
    required TResult Function(ImageEventOnImageDeleteFailure value)
        onImageDeleteFailure,
  }) {
    return onImageDeleteFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageEventError value)? error,
    TResult? Function(ImageEventLoading value)? loading,
    TResult? Function(ImageEventLoaded value)? loaded,
    TResult? Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult? Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult? Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
  }) {
    return onImageDeleteFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageEventError value)? error,
    TResult Function(ImageEventLoading value)? loading,
    TResult Function(ImageEventLoaded value)? loaded,
    TResult Function(ImageEventOnImageUploadSuccess value)?
        onImageUploadSuccess,
    TResult Function(ImageEventOnImageDeleteSuccess value)?
        onImageDeleteSuccess,
    TResult Function(ImageEventOnImageDeleteFailure value)?
        onImageDeleteFailure,
    required TResult orElse(),
  }) {
    if (onImageDeleteFailure != null) {
      return onImageDeleteFailure(this);
    }
    return orElse();
  }
}

abstract class ImageEventOnImageDeleteFailure implements ImageEvent {
  const factory ImageEventOnImageDeleteFailure(final Exception e) =
      _$ImageEventOnImageDeleteFailureImpl;

  Exception get e;
  @JsonKey(ignore: true)
  _$$ImageEventOnImageDeleteFailureImplCopyWith<
          _$ImageEventOnImageDeleteFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
