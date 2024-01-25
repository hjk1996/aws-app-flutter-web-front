// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageMetadata _$ImageMetadataFromJson(Map<String, dynamic> json) {
  return _ImageMetadata.fromJson(json);
}

/// @nodoc
mixin _$ImageMetadata {
  int get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get imageName => throw _privateConstructorUsedError;
  bool get bookmark => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageMetadataCopyWith<ImageMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageMetadataCopyWith<$Res> {
  factory $ImageMetadataCopyWith(
          ImageMetadata value, $Res Function(ImageMetadata) then) =
      _$ImageMetadataCopyWithImpl<$Res, ImageMetadata>;
  @useResult
  $Res call(
      {int id,
      String userId,
      String imageName,
      bool bookmark,
      @TimestampSerializer() DateTime createdAt});
}

/// @nodoc
class _$ImageMetadataCopyWithImpl<$Res, $Val extends ImageMetadata>
    implements $ImageMetadataCopyWith<$Res> {
  _$ImageMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? imageName = null,
    Object? bookmark = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      bookmark: null == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageMetadataImplCopyWith<$Res>
    implements $ImageMetadataCopyWith<$Res> {
  factory _$$ImageMetadataImplCopyWith(
          _$ImageMetadataImpl value, $Res Function(_$ImageMetadataImpl) then) =
      __$$ImageMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String userId,
      String imageName,
      bool bookmark,
      @TimestampSerializer() DateTime createdAt});
}

/// @nodoc
class __$$ImageMetadataImplCopyWithImpl<$Res>
    extends _$ImageMetadataCopyWithImpl<$Res, _$ImageMetadataImpl>
    implements _$$ImageMetadataImplCopyWith<$Res> {
  __$$ImageMetadataImplCopyWithImpl(
      _$ImageMetadataImpl _value, $Res Function(_$ImageMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? imageName = null,
    Object? bookmark = null,
    Object? createdAt = null,
  }) {
    return _then(_$ImageMetadataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      bookmark: null == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageMetadataImpl implements _ImageMetadata {
  _$ImageMetadataImpl(
      {required this.id,
      required this.userId,
      required this.imageName,
      required this.bookmark,
      @TimestampSerializer() required this.createdAt});

  factory _$ImageMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageMetadataImplFromJson(json);

  @override
  final int id;
  @override
  final String userId;
  @override
  final String imageName;
  @override
  final bool bookmark;
  @override
  @TimestampSerializer()
  final DateTime createdAt;

  @override
  String toString() {
    return 'ImageMetadata(id: $id, userId: $userId, imageName: $imageName, bookmark: $bookmark, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageMetadataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.imageName, imageName) ||
                other.imageName == imageName) &&
            (identical(other.bookmark, bookmark) ||
                other.bookmark == bookmark) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, imageName, bookmark, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageMetadataImplCopyWith<_$ImageMetadataImpl> get copyWith =>
      __$$ImageMetadataImplCopyWithImpl<_$ImageMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageMetadataImplToJson(
      this,
    );
  }
}

abstract class _ImageMetadata implements ImageMetadata {
  factory _ImageMetadata(
          {required final int id,
          required final String userId,
          required final String imageName,
          required final bool bookmark,
          @TimestampSerializer() required final DateTime createdAt}) =
      _$ImageMetadataImpl;

  factory _ImageMetadata.fromJson(Map<String, dynamic> json) =
      _$ImageMetadataImpl.fromJson;

  @override
  int get id;
  @override
  String get userId;
  @override
  String get imageName;
  @override
  bool get bookmark;
  @override
  @TimestampSerializer()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ImageMetadataImplCopyWith<_$ImageMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
