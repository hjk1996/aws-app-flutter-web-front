// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_tag_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageTagListState _$ImageTagListStateFromJson(Map<String, dynamic> json) {
  return _ImageTagListState.fromJson(json);
}

/// @nodoc
mixin _$ImageTagListState {
  bool get loading => throw _privateConstructorUsedError;
  List<TagInfo> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageTagListStateCopyWith<ImageTagListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageTagListStateCopyWith<$Res> {
  factory $ImageTagListStateCopyWith(
          ImageTagListState value, $Res Function(ImageTagListState) then) =
      _$ImageTagListStateCopyWithImpl<$Res, ImageTagListState>;
  @useResult
  $Res call({bool loading, List<TagInfo> tags});
}

/// @nodoc
class _$ImageTagListStateCopyWithImpl<$Res, $Val extends ImageTagListState>
    implements $ImageTagListStateCopyWith<$Res> {
  _$ImageTagListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageTagListStateImplCopyWith<$Res>
    implements $ImageTagListStateCopyWith<$Res> {
  factory _$$ImageTagListStateImplCopyWith(_$ImageTagListStateImpl value,
          $Res Function(_$ImageTagListStateImpl) then) =
      __$$ImageTagListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<TagInfo> tags});
}

/// @nodoc
class __$$ImageTagListStateImplCopyWithImpl<$Res>
    extends _$ImageTagListStateCopyWithImpl<$Res, _$ImageTagListStateImpl>
    implements _$$ImageTagListStateImplCopyWith<$Res> {
  __$$ImageTagListStateImplCopyWithImpl(_$ImageTagListStateImpl _value,
      $Res Function(_$ImageTagListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? tags = null,
  }) {
    return _then(_$ImageTagListStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageTagListStateImpl implements _ImageTagListState {
  _$ImageTagListStateImpl(
      {required this.loading, required final List<TagInfo> tags})
      : _tags = tags;

  factory _$ImageTagListStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageTagListStateImplFromJson(json);

  @override
  final bool loading;
  final List<TagInfo> _tags;
  @override
  List<TagInfo> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'ImageTagListState(loading: $loading, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageTagListStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageTagListStateImplCopyWith<_$ImageTagListStateImpl> get copyWith =>
      __$$ImageTagListStateImplCopyWithImpl<_$ImageTagListStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageTagListStateImplToJson(
      this,
    );
  }
}

abstract class _ImageTagListState implements ImageTagListState {
  factory _ImageTagListState(
      {required final bool loading,
      required final List<TagInfo> tags}) = _$ImageTagListStateImpl;

  factory _ImageTagListState.fromJson(Map<String, dynamic> json) =
      _$ImageTagListStateImpl.fromJson;

  @override
  bool get loading;
  @override
  List<TagInfo> get tags;
  @override
  @JsonKey(ignore: true)
  _$$ImageTagListStateImplCopyWith<_$ImageTagListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
