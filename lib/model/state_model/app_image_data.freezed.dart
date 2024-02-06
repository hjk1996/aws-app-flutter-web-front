// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_image_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppImageData {
  bool get selected => throw _privateConstructorUsedError;
  Uint8List? get thumbnail => throw _privateConstructorUsedError;
  Uint8List? get original => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppImageDataCopyWith<AppImageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppImageDataCopyWith<$Res> {
  factory $AppImageDataCopyWith(
          AppImageData value, $Res Function(AppImageData) then) =
      _$AppImageDataCopyWithImpl<$Res, AppImageData>;
  @useResult
  $Res call({bool selected, Uint8List? thumbnail, Uint8List? original});
}

/// @nodoc
class _$AppImageDataCopyWithImpl<$Res, $Val extends AppImageData>
    implements $AppImageDataCopyWith<$Res> {
  _$AppImageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
    Object? thumbnail = freezed,
    Object? original = freezed,
  }) {
    return _then(_value.copyWith(
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      original: freezed == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppImageDataImplCopyWith<$Res>
    implements $AppImageDataCopyWith<$Res> {
  factory _$$AppImageDataImplCopyWith(
          _$AppImageDataImpl value, $Res Function(_$AppImageDataImpl) then) =
      __$$AppImageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool selected, Uint8List? thumbnail, Uint8List? original});
}

/// @nodoc
class __$$AppImageDataImplCopyWithImpl<$Res>
    extends _$AppImageDataCopyWithImpl<$Res, _$AppImageDataImpl>
    implements _$$AppImageDataImplCopyWith<$Res> {
  __$$AppImageDataImplCopyWithImpl(
      _$AppImageDataImpl _value, $Res Function(_$AppImageDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
    Object? thumbnail = freezed,
    Object? original = freezed,
  }) {
    return _then(_$AppImageDataImpl(
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      original: freezed == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$AppImageDataImpl implements _AppImageData {
  _$AppImageDataImpl({required this.selected, this.thumbnail, this.original});

  @override
  final bool selected;
  @override
  final Uint8List? thumbnail;
  @override
  final Uint8List? original;

  @override
  String toString() {
    return 'AppImageData(selected: $selected, thumbnail: $thumbnail, original: $original)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppImageDataImpl &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.original, original));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selected,
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(original));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppImageDataImplCopyWith<_$AppImageDataImpl> get copyWith =>
      __$$AppImageDataImplCopyWithImpl<_$AppImageDataImpl>(this, _$identity);
}

abstract class _AppImageData implements AppImageData {
  factory _AppImageData(
      {required final bool selected,
      final Uint8List? thumbnail,
      final Uint8List? original}) = _$AppImageDataImpl;

  @override
  bool get selected;
  @override
  Uint8List? get thumbnail;
  @override
  Uint8List? get original;
  @override
  @JsonKey(ignore: true)
  _$$AppImageDataImplCopyWith<_$AppImageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
