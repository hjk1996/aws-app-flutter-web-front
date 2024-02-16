// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchEventError value) error,
    required TResult Function(SearchEventLoading value) loading,
    required TResult Function(SearchEventLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventError value)? error,
    TResult? Function(SearchEventLoading value)? loading,
    TResult? Function(SearchEventLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventError value)? error,
    TResult Function(SearchEventLoading value)? loading,
    TResult Function(SearchEventLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchEventErrorImplCopyWith<$Res> {
  factory _$$SearchEventErrorImplCopyWith(_$SearchEventErrorImpl value,
          $Res Function(_$SearchEventErrorImpl) then) =
      __$$SearchEventErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SearchEventErrorImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventErrorImpl>
    implements _$$SearchEventErrorImplCopyWith<$Res> {
  __$$SearchEventErrorImplCopyWithImpl(_$SearchEventErrorImpl _value,
      $Res Function(_$SearchEventErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SearchEventErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchEventErrorImpl implements SearchEventError {
  const _$SearchEventErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SearchEvent.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventErrorImplCopyWith<_$SearchEventErrorImpl> get copyWith =>
      __$$SearchEventErrorImplCopyWithImpl<_$SearchEventErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchEventError value) error,
    required TResult Function(SearchEventLoading value) loading,
    required TResult Function(SearchEventLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventError value)? error,
    TResult? Function(SearchEventLoading value)? loading,
    TResult? Function(SearchEventLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventError value)? error,
    TResult Function(SearchEventLoading value)? loading,
    TResult Function(SearchEventLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SearchEventError implements SearchEvent {
  const factory SearchEventError(final String message) = _$SearchEventErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SearchEventErrorImplCopyWith<_$SearchEventErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventLoadingImplCopyWith<$Res> {
  factory _$$SearchEventLoadingImplCopyWith(_$SearchEventLoadingImpl value,
          $Res Function(_$SearchEventLoadingImpl) then) =
      __$$SearchEventLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchEventLoadingImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventLoadingImpl>
    implements _$$SearchEventLoadingImplCopyWith<$Res> {
  __$$SearchEventLoadingImplCopyWithImpl(_$SearchEventLoadingImpl _value,
      $Res Function(_$SearchEventLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchEventLoadingImpl implements SearchEventLoading {
  const _$SearchEventLoadingImpl();

  @override
  String toString() {
    return 'SearchEvent.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchEventLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
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
    required TResult Function(SearchEventError value) error,
    required TResult Function(SearchEventLoading value) loading,
    required TResult Function(SearchEventLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventError value)? error,
    TResult? Function(SearchEventLoading value)? loading,
    TResult? Function(SearchEventLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventError value)? error,
    TResult Function(SearchEventLoading value)? loading,
    TResult Function(SearchEventLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SearchEventLoading implements SearchEvent {
  const factory SearchEventLoading() = _$SearchEventLoadingImpl;
}

/// @nodoc
abstract class _$$SearchEventLoadedImplCopyWith<$Res> {
  factory _$$SearchEventLoadedImplCopyWith(_$SearchEventLoadedImpl value,
          $Res Function(_$SearchEventLoadedImpl) then) =
      __$$SearchEventLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchEventLoadedImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchEventLoadedImpl>
    implements _$$SearchEventLoadedImplCopyWith<$Res> {
  __$$SearchEventLoadedImplCopyWithImpl(_$SearchEventLoadedImpl _value,
      $Res Function(_$SearchEventLoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchEventLoadedImpl implements SearchEventLoaded {
  const _$SearchEventLoadedImpl();

  @override
  String toString() {
    return 'SearchEvent.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchEventLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() loading,
    required TResult Function() loaded,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? loading,
    TResult? Function()? loaded,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? loading,
    TResult Function()? loaded,
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
    required TResult Function(SearchEventError value) error,
    required TResult Function(SearchEventLoading value) loading,
    required TResult Function(SearchEventLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchEventError value)? error,
    TResult? Function(SearchEventLoading value)? loading,
    TResult? Function(SearchEventLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchEventError value)? error,
    TResult Function(SearchEventLoading value)? loading,
    TResult Function(SearchEventLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SearchEventLoaded implements SearchEvent {
  const factory SearchEventLoaded() = _$SearchEventLoadedImpl;
}
