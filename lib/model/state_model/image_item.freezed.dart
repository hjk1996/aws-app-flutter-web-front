// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageItem {
  ImageMetadata get imageMetadata => throw _privateConstructorUsedError;
  ImageData get imageData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageItemCopyWith<ImageItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageItemCopyWith<$Res> {
  factory $ImageItemCopyWith(ImageItem value, $Res Function(ImageItem) then) =
      _$ImageItemCopyWithImpl<$Res, ImageItem>;
  @useResult
  $Res call({ImageMetadata imageMetadata, ImageData imageData});

  $ImageMetadataCopyWith<$Res> get imageMetadata;
  $ImageDataCopyWith<$Res> get imageData;
}

/// @nodoc
class _$ImageItemCopyWithImpl<$Res, $Val extends ImageItem>
    implements $ImageItemCopyWith<$Res> {
  _$ImageItemCopyWithImpl(this._value, this._then);

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
              as ImageMetadata,
      imageData: null == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as ImageData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageMetadataCopyWith<$Res> get imageMetadata {
    return $ImageMetadataCopyWith<$Res>(_value.imageMetadata, (value) {
      return _then(_value.copyWith(imageMetadata: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageDataCopyWith<$Res> get imageData {
    return $ImageDataCopyWith<$Res>(_value.imageData, (value) {
      return _then(_value.copyWith(imageData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImageItemImplCopyWith<$Res>
    implements $ImageItemCopyWith<$Res> {
  factory _$$ImageItemImplCopyWith(
          _$ImageItemImpl value, $Res Function(_$ImageItemImpl) then) =
      __$$ImageItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageMetadata imageMetadata, ImageData imageData});

  @override
  $ImageMetadataCopyWith<$Res> get imageMetadata;
  @override
  $ImageDataCopyWith<$Res> get imageData;
}

/// @nodoc
class __$$ImageItemImplCopyWithImpl<$Res>
    extends _$ImageItemCopyWithImpl<$Res, _$ImageItemImpl>
    implements _$$ImageItemImplCopyWith<$Res> {
  __$$ImageItemImplCopyWithImpl(
      _$ImageItemImpl _value, $Res Function(_$ImageItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageMetadata = null,
    Object? imageData = null,
  }) {
    return _then(_$ImageItemImpl(
      imageMetadata: null == imageMetadata
          ? _value.imageMetadata
          : imageMetadata // ignore: cast_nullable_to_non_nullable
              as ImageMetadata,
      imageData: null == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as ImageData,
    ));
  }
}

/// @nodoc

class _$ImageItemImpl implements _ImageItem {
  _$ImageItemImpl({required this.imageMetadata, required this.imageData});

  @override
  final ImageMetadata imageMetadata;
  @override
  final ImageData imageData;

  @override
  String toString() {
    return 'ImageItem(imageMetadata: $imageMetadata, imageData: $imageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageItemImpl &&
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
  _$$ImageItemImplCopyWith<_$ImageItemImpl> get copyWith =>
      __$$ImageItemImplCopyWithImpl<_$ImageItemImpl>(this, _$identity);
}

abstract class _ImageItem implements ImageItem {
  factory _ImageItem(
      {required final ImageMetadata imageMetadata,
      required final ImageData imageData}) = _$ImageItemImpl;

  @override
  ImageMetadata get imageMetadata;
  @override
  ImageData get imageData;
  @override
  @JsonKey(ignore: true)
  _$$ImageItemImplCopyWith<_$ImageItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
