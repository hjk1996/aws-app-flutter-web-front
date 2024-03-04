// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result_album_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchResultAlbumState _$SearchResultAlbumStateFromJson(
    Map<String, dynamic> json) {
  return _SearchResultAlbumState.fromJson(json);
}

/// @nodoc
mixin _$SearchResultAlbumState {
  bool get loading => throw _privateConstructorUsedError;
  int? get currentImageIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResultAlbumStateCopyWith<SearchResultAlbumState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultAlbumStateCopyWith<$Res> {
  factory $SearchResultAlbumStateCopyWith(SearchResultAlbumState value,
          $Res Function(SearchResultAlbumState) then) =
      _$SearchResultAlbumStateCopyWithImpl<$Res, SearchResultAlbumState>;
  @useResult
  $Res call({bool loading, int? currentImageIndex});
}

/// @nodoc
class _$SearchResultAlbumStateCopyWithImpl<$Res,
        $Val extends SearchResultAlbumState>
    implements $SearchResultAlbumStateCopyWith<$Res> {
  _$SearchResultAlbumStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? currentImageIndex = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentImageIndex: freezed == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchResultAlbumStateImplCopyWith<$Res>
    implements $SearchResultAlbumStateCopyWith<$Res> {
  factory _$$SearchResultAlbumStateImplCopyWith(
          _$SearchResultAlbumStateImpl value,
          $Res Function(_$SearchResultAlbumStateImpl) then) =
      __$$SearchResultAlbumStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, int? currentImageIndex});
}

/// @nodoc
class __$$SearchResultAlbumStateImplCopyWithImpl<$Res>
    extends _$SearchResultAlbumStateCopyWithImpl<$Res,
        _$SearchResultAlbumStateImpl>
    implements _$$SearchResultAlbumStateImplCopyWith<$Res> {
  __$$SearchResultAlbumStateImplCopyWithImpl(
      _$SearchResultAlbumStateImpl _value,
      $Res Function(_$SearchResultAlbumStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? currentImageIndex = freezed,
  }) {
    return _then(_$SearchResultAlbumStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentImageIndex: freezed == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResultAlbumStateImpl implements _SearchResultAlbumState {
  _$SearchResultAlbumStateImpl({required this.loading, this.currentImageIndex});

  factory _$SearchResultAlbumStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResultAlbumStateImplFromJson(json);

  @override
  final bool loading;
  @override
  final int? currentImageIndex;

  @override
  String toString() {
    return 'SearchResultAlbumState(loading: $loading, currentImageIndex: $currentImageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultAlbumStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.currentImageIndex, currentImageIndex) ||
                other.currentImageIndex == currentImageIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, loading, currentImageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultAlbumStateImplCopyWith<_$SearchResultAlbumStateImpl>
      get copyWith => __$$SearchResultAlbumStateImplCopyWithImpl<
          _$SearchResultAlbumStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResultAlbumStateImplToJson(
      this,
    );
  }
}

abstract class _SearchResultAlbumState implements SearchResultAlbumState {
  factory _SearchResultAlbumState(
      {required final bool loading,
      final int? currentImageIndex}) = _$SearchResultAlbumStateImpl;

  factory _SearchResultAlbumState.fromJson(Map<String, dynamic> json) =
      _$SearchResultAlbumStateImpl.fromJson;

  @override
  bool get loading;
  @override
  int? get currentImageIndex;
  @override
  @JsonKey(ignore: true)
  _$$SearchResultAlbumStateImplCopyWith<_$SearchResultAlbumStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
