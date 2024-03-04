// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_search_result_album_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FaceSearchResultAlbumState _$FaceSearchResultAlbumStateFromJson(
    Map<String, dynamic> json) {
  return _FaceSearchResultAlbumState.fromJson(json);
}

/// @nodoc
mixin _$FaceSearchResultAlbumState {
  bool get loading => throw _privateConstructorUsedError;
  int? get currentImageIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FaceSearchResultAlbumStateCopyWith<FaceSearchResultAlbumState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceSearchResultAlbumStateCopyWith<$Res> {
  factory $FaceSearchResultAlbumStateCopyWith(FaceSearchResultAlbumState value,
          $Res Function(FaceSearchResultAlbumState) then) =
      _$FaceSearchResultAlbumStateCopyWithImpl<$Res,
          FaceSearchResultAlbumState>;
  @useResult
  $Res call({bool loading, int? currentImageIndex});
}

/// @nodoc
class _$FaceSearchResultAlbumStateCopyWithImpl<$Res,
        $Val extends FaceSearchResultAlbumState>
    implements $FaceSearchResultAlbumStateCopyWith<$Res> {
  _$FaceSearchResultAlbumStateCopyWithImpl(this._value, this._then);

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
abstract class _$$FaceSearchResultAlbumStateImplCopyWith<$Res>
    implements $FaceSearchResultAlbumStateCopyWith<$Res> {
  factory _$$FaceSearchResultAlbumStateImplCopyWith(
          _$FaceSearchResultAlbumStateImpl value,
          $Res Function(_$FaceSearchResultAlbumStateImpl) then) =
      __$$FaceSearchResultAlbumStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, int? currentImageIndex});
}

/// @nodoc
class __$$FaceSearchResultAlbumStateImplCopyWithImpl<$Res>
    extends _$FaceSearchResultAlbumStateCopyWithImpl<$Res,
        _$FaceSearchResultAlbumStateImpl>
    implements _$$FaceSearchResultAlbumStateImplCopyWith<$Res> {
  __$$FaceSearchResultAlbumStateImplCopyWithImpl(
      _$FaceSearchResultAlbumStateImpl _value,
      $Res Function(_$FaceSearchResultAlbumStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? currentImageIndex = freezed,
  }) {
    return _then(_$FaceSearchResultAlbumStateImpl(
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
class _$FaceSearchResultAlbumStateImpl implements _FaceSearchResultAlbumState {
  _$FaceSearchResultAlbumStateImpl(
      {required this.loading, this.currentImageIndex});

  factory _$FaceSearchResultAlbumStateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FaceSearchResultAlbumStateImplFromJson(json);

  @override
  final bool loading;
  @override
  final int? currentImageIndex;

  @override
  String toString() {
    return 'FaceSearchResultAlbumState(loading: $loading, currentImageIndex: $currentImageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceSearchResultAlbumStateImpl &&
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
  _$$FaceSearchResultAlbumStateImplCopyWith<_$FaceSearchResultAlbumStateImpl>
      get copyWith => __$$FaceSearchResultAlbumStateImplCopyWithImpl<
          _$FaceSearchResultAlbumStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaceSearchResultAlbumStateImplToJson(
      this,
    );
  }
}

abstract class _FaceSearchResultAlbumState
    implements FaceSearchResultAlbumState {
  factory _FaceSearchResultAlbumState(
      {required final bool loading,
      final int? currentImageIndex}) = _$FaceSearchResultAlbumStateImpl;

  factory _FaceSearchResultAlbumState.fromJson(Map<String, dynamic> json) =
      _$FaceSearchResultAlbumStateImpl.fromJson;

  @override
  bool get loading;
  @override
  int? get currentImageIndex;
  @override
  @JsonKey(ignore: true)
  _$$FaceSearchResultAlbumStateImplCopyWith<_$FaceSearchResultAlbumStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
