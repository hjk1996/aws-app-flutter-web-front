// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FaceSearchState {
  bool get loading => throw _privateConstructorUsedError;
  int? get currentImageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaceSearchStateCopyWith<FaceSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceSearchStateCopyWith<$Res> {
  factory $FaceSearchStateCopyWith(
          FaceSearchState value, $Res Function(FaceSearchState) then) =
      _$FaceSearchStateCopyWithImpl<$Res, FaceSearchState>;
  @useResult
  $Res call({bool loading, int? currentImageIndex});
}

/// @nodoc
class _$FaceSearchStateCopyWithImpl<$Res, $Val extends FaceSearchState>
    implements $FaceSearchStateCopyWith<$Res> {
  _$FaceSearchStateCopyWithImpl(this._value, this._then);

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
abstract class _$$FaceSearchStateImplCopyWith<$Res>
    implements $FaceSearchStateCopyWith<$Res> {
  factory _$$FaceSearchStateImplCopyWith(_$FaceSearchStateImpl value,
          $Res Function(_$FaceSearchStateImpl) then) =
      __$$FaceSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, int? currentImageIndex});
}

/// @nodoc
class __$$FaceSearchStateImplCopyWithImpl<$Res>
    extends _$FaceSearchStateCopyWithImpl<$Res, _$FaceSearchStateImpl>
    implements _$$FaceSearchStateImplCopyWith<$Res> {
  __$$FaceSearchStateImplCopyWithImpl(
      _$FaceSearchStateImpl _value, $Res Function(_$FaceSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? currentImageIndex = freezed,
  }) {
    return _then(_$FaceSearchStateImpl(
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

class _$FaceSearchStateImpl implements _FaceSearchState {
  _$FaceSearchStateImpl({required this.loading, this.currentImageIndex});

  @override
  final bool loading;
  @override
  final int? currentImageIndex;

  @override
  String toString() {
    return 'FaceSearchState(loading: $loading, currentImageIndex: $currentImageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceSearchStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.currentImageIndex, currentImageIndex) ||
                other.currentImageIndex == currentImageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, currentImageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceSearchStateImplCopyWith<_$FaceSearchStateImpl> get copyWith =>
      __$$FaceSearchStateImplCopyWithImpl<_$FaceSearchStateImpl>(
          this, _$identity);
}

abstract class _FaceSearchState implements FaceSearchState {
  factory _FaceSearchState(
      {required final bool loading,
      final int? currentImageIndex}) = _$FaceSearchStateImpl;

  @override
  bool get loading;
  @override
  int? get currentImageIndex;
  @override
  @JsonKey(ignore: true)
  _$$FaceSearchStateImplCopyWith<_$FaceSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
