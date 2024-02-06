// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_image_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppImageMetadata _$AppImageMetadataFromJson(Map<String, dynamic> json) {
  return _AppImageMetadata.fromJson(json);
}

/// @nodoc
mixin _$AppImageMetadata {
  @JsonKey(name: 'picture_id')
  int get pictureId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _bookmarkedFromJson, toJson: _bookmarkedToJson)
  bool get bookmarked => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'created_at', fromJson: _datetimeFromJson, toJson: _datetimeToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppImageMetadataCopyWith<AppImageMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppImageMetadataCopyWith<$Res> {
  factory $AppImageMetadataCopyWith(
          AppImageMetadata value, $Res Function(AppImageMetadata) then) =
      _$AppImageMetadataCopyWithImpl<$Res, AppImageMetadata>;
  @useResult
  $Res call(
      {@JsonKey(name: 'picture_id') int pictureId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(fromJson: _bookmarkedFromJson, toJson: _bookmarkedToJson)
      bool bookmarked,
      @JsonKey(
          name: 'created_at',
          fromJson: _datetimeFromJson,
          toJson: _datetimeToJson)
      DateTime createdAt});
}

/// @nodoc
class _$AppImageMetadataCopyWithImpl<$Res, $Val extends AppImageMetadata>
    implements $AppImageMetadataCopyWith<$Res> {
  _$AppImageMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pictureId = null,
    Object? userId = null,
    Object? imageUrl = null,
    Object? bookmarked = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      pictureId: null == pictureId
          ? _value.pictureId
          : pictureId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarked: null == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppImageMetadataImplCopyWith<$Res>
    implements $AppImageMetadataCopyWith<$Res> {
  factory _$$AppImageMetadataImplCopyWith(_$AppImageMetadataImpl value,
          $Res Function(_$AppImageMetadataImpl) then) =
      __$$AppImageMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'picture_id') int pictureId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(fromJson: _bookmarkedFromJson, toJson: _bookmarkedToJson)
      bool bookmarked,
      @JsonKey(
          name: 'created_at',
          fromJson: _datetimeFromJson,
          toJson: _datetimeToJson)
      DateTime createdAt});
}

/// @nodoc
class __$$AppImageMetadataImplCopyWithImpl<$Res>
    extends _$AppImageMetadataCopyWithImpl<$Res, _$AppImageMetadataImpl>
    implements _$$AppImageMetadataImplCopyWith<$Res> {
  __$$AppImageMetadataImplCopyWithImpl(_$AppImageMetadataImpl _value,
      $Res Function(_$AppImageMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pictureId = null,
    Object? userId = null,
    Object? imageUrl = null,
    Object? bookmarked = null,
    Object? createdAt = null,
  }) {
    return _then(_$AppImageMetadataImpl(
      pictureId: null == pictureId
          ? _value.pictureId
          : pictureId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarked: null == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
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
class _$AppImageMetadataImpl implements _AppImageMetadata {
  _$AppImageMetadataImpl(
      {@JsonKey(name: 'picture_id') required this.pictureId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(fromJson: _bookmarkedFromJson, toJson: _bookmarkedToJson)
      required this.bookmarked,
      @JsonKey(
          name: 'created_at',
          fromJson: _datetimeFromJson,
          toJson: _datetimeToJson)
      required this.createdAt});

  factory _$AppImageMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppImageMetadataImplFromJson(json);

  @override
  @JsonKey(name: 'picture_id')
  final int pictureId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(fromJson: _bookmarkedFromJson, toJson: _bookmarkedToJson)
  final bool bookmarked;
  @override
  @JsonKey(
      name: 'created_at', fromJson: _datetimeFromJson, toJson: _datetimeToJson)
  final DateTime createdAt;

  @override
  String toString() {
    return 'AppImageMetadata(pictureId: $pictureId, userId: $userId, imageUrl: $imageUrl, bookmarked: $bookmarked, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppImageMetadataImpl &&
            (identical(other.pictureId, pictureId) ||
                other.pictureId == pictureId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pictureId, userId, imageUrl, bookmarked, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppImageMetadataImplCopyWith<_$AppImageMetadataImpl> get copyWith =>
      __$$AppImageMetadataImplCopyWithImpl<_$AppImageMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppImageMetadataImplToJson(
      this,
    );
  }
}

abstract class _AppImageMetadata implements AppImageMetadata {
  factory _AppImageMetadata(
      {@JsonKey(name: 'picture_id') required final int pictureId,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'image_url') required final String imageUrl,
      @JsonKey(fromJson: _bookmarkedFromJson, toJson: _bookmarkedToJson)
      required final bool bookmarked,
      @JsonKey(
          name: 'created_at',
          fromJson: _datetimeFromJson,
          toJson: _datetimeToJson)
      required final DateTime createdAt}) = _$AppImageMetadataImpl;

  factory _AppImageMetadata.fromJson(Map<String, dynamic> json) =
      _$AppImageMetadataImpl.fromJson;

  @override
  @JsonKey(name: 'picture_id')
  int get pictureId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(fromJson: _bookmarkedFromJson, toJson: _bookmarkedToJson)
  bool get bookmarked;
  @override
  @JsonKey(
      name: 'created_at', fromJson: _datetimeFromJson, toJson: _datetimeToJson)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$AppImageMetadataImplCopyWith<_$AppImageMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
