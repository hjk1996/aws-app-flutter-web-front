// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_image_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppImageItem {
  AppImageMetadata get imageMetadata => throw _privateConstructorUsedError;
  AppImageData get imageData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppImageItemCopyWith<AppImageItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppImageItemCopyWith<$Res> {
  factory $AppImageItemCopyWith(
          AppImageItem value, $Res Function(AppImageItem) then) =
      _$AppImageItemCopyWithImpl<$Res, AppImageItem>;
  @useResult
  $Res call({AppImageMetadata imageMetadata, AppImageData imageData});

  $AppImageMetadataCopyWith<$Res> get imageMetadata;
  $AppImageDataCopyWith<$Res> get imageData;
}

/// @nodoc
class _$AppImageItemCopyWithImpl<$Res, $Val extends AppImageItem>
    implements $AppImageItemCopyWith<$Res> {
  _$AppImageItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageMetadata = null,
    Object? imageData = null,
  }) {
    return _then(_value.copyWith(
      imageMetadata: null == imageMetadata
          ? _value.imageMetadata
          : imageMetadata // ignore: cast_nullable_to_non_nullable
              as AppImageMetadata,
      imageData: null == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as AppImageData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppImageMetadataCopyWith<$Res> get imageMetadata {
    return $AppImageMetadataCopyWith<$Res>(_value.imageMetadata, (value) {
      return _then(_value.copyWith(imageMetadata: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppImageDataCopyWith<$Res> get imageData {
    return $AppImageDataCopyWith<$Res>(_value.imageData, (value) {
      return _then(_value.copyWith(imageData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppImageItemImplCopyWith<$Res>
    implements $AppImageItemCopyWith<$Res> {
  factory _$$AppImageItemImplCopyWith(
          _$AppImageItemImpl value, $Res Function(_$AppImageItemImpl) then) =
      __$$AppImageItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppImageMetadata imageMetadata, AppImageData imageData});

  @override
  $AppImageMetadataCopyWith<$Res> get imageMetadata;
  @override
  $AppImageDataCopyWith<$Res> get imageData;
}

/// @nodoc
class __$$AppImageItemImplCopyWithImpl<$Res>
    extends _$AppImageItemCopyWithImpl<$Res, _$AppImageItemImpl>
    implements _$$AppImageItemImplCopyWith<$Res> {
  __$$AppImageItemImplCopyWithImpl(
      _$AppImageItemImpl _value, $Res Function(_$AppImageItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageMetadata = null,
    Object? imageData = null,
  }) {
    return _then(_$AppImageItemImpl(
      imageMetadata: null == imageMetadata
          ? _value.imageMetadata
          : imageMetadata // ignore: cast_nullable_to_non_nullable
              as AppImageMetadata,
      imageData: null == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as AppImageData,
    ));
  }
}

/// @nodoc

class _$AppImageItemImpl implements _AppImageItem {
  _$AppImageItemImpl({required this.imageMetadata, required this.imageData});

  @override
  final AppImageMetadata imageMetadata;
  @override
  final AppImageData imageData;

  @override
  String toString() {
    return 'AppImageItem(imageMetadata: $imageMetadata, imageData: $imageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppImageItemImpl &&
            (identical(other.imageMetadata, imageMetadata) ||
                other.imageMetadata == imageMetadata) &&
            (identical(other.imageData, imageData) ||
                other.imageData == imageData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageMetadata, imageData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppImageItemImplCopyWith<_$AppImageItemImpl> get copyWith =>
      __$$AppImageItemImplCopyWithImpl<_$AppImageItemImpl>(this, _$identity);
}

abstract class _AppImageItem implements AppImageItem {
  factory _AppImageItem(
      {required final AppImageMetadata imageMetadata,
      required final AppImageData imageData}) = _$AppImageItemImpl;

  @override
  AppImageMetadata get imageMetadata;
  @override
  AppImageData get imageData;
  @override
  @JsonKey(ignore: true)
  _$$AppImageItemImplCopyWith<_$AppImageItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
