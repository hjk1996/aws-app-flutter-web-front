// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QueryResponse _$QueryResponseFromJson(Map<String, dynamic> json) {
  return _QueryResponse.fromJson(json);
}

/// @nodoc
mixin _$QueryResponse {
  @JsonKey(
      name: 'created_at', fromJson: _datetimeFromJson, toJson: _datetimeToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  QueryType get queryType => throw _privateConstructorUsedError;
  List<AppImageMetadata> get imageMetadataList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryResponseCopyWith<QueryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryResponseCopyWith<$Res> {
  factory $QueryResponseCopyWith(
          QueryResponse value, $Res Function(QueryResponse) then) =
      _$QueryResponseCopyWithImpl<$Res, QueryResponse>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'created_at',
          fromJson: _datetimeFromJson,
          toJson: _datetimeToJson)
      DateTime createdAt,
      QueryType queryType,
      List<AppImageMetadata> imageMetadataList});
}

/// @nodoc
class _$QueryResponseCopyWithImpl<$Res, $Val extends QueryResponse>
    implements $QueryResponseCopyWith<$Res> {
  _$QueryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? queryType = null,
    Object? imageMetadataList = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      queryType: null == queryType
          ? _value.queryType
          : queryType // ignore: cast_nullable_to_non_nullable
              as QueryType,
      imageMetadataList: null == imageMetadataList
          ? _value.imageMetadataList
          : imageMetadataList // ignore: cast_nullable_to_non_nullable
              as List<AppImageMetadata>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryResponseImplCopyWith<$Res>
    implements $QueryResponseCopyWith<$Res> {
  factory _$$QueryResponseImplCopyWith(
          _$QueryResponseImpl value, $Res Function(_$QueryResponseImpl) then) =
      __$$QueryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'created_at',
          fromJson: _datetimeFromJson,
          toJson: _datetimeToJson)
      DateTime createdAt,
      QueryType queryType,
      List<AppImageMetadata> imageMetadataList});
}

/// @nodoc
class __$$QueryResponseImplCopyWithImpl<$Res>
    extends _$QueryResponseCopyWithImpl<$Res, _$QueryResponseImpl>
    implements _$$QueryResponseImplCopyWith<$Res> {
  __$$QueryResponseImplCopyWithImpl(
      _$QueryResponseImpl _value, $Res Function(_$QueryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? queryType = null,
    Object? imageMetadataList = null,
  }) {
    return _then(_$QueryResponseImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      queryType: null == queryType
          ? _value.queryType
          : queryType // ignore: cast_nullable_to_non_nullable
              as QueryType,
      imageMetadataList: null == imageMetadataList
          ? _value._imageMetadataList
          : imageMetadataList // ignore: cast_nullable_to_non_nullable
              as List<AppImageMetadata>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryResponseImpl implements _QueryResponse {
  _$QueryResponseImpl(
      {@JsonKey(
          name: 'created_at',
          fromJson: _datetimeFromJson,
          toJson: _datetimeToJson)
      required this.createdAt,
      required this.queryType,
      required final List<AppImageMetadata> imageMetadataList})
      : _imageMetadataList = imageMetadataList;

  factory _$QueryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryResponseImplFromJson(json);

  @override
  @JsonKey(
      name: 'created_at', fromJson: _datetimeFromJson, toJson: _datetimeToJson)
  final DateTime createdAt;
  @override
  final QueryType queryType;
  final List<AppImageMetadata> _imageMetadataList;
  @override
  List<AppImageMetadata> get imageMetadataList {
    if (_imageMetadataList is EqualUnmodifiableListView)
      return _imageMetadataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageMetadataList);
  }

  @override
  String toString() {
    return 'QueryResponse(createdAt: $createdAt, queryType: $queryType, imageMetadataList: $imageMetadataList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryResponseImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.queryType, queryType) ||
                other.queryType == queryType) &&
            const DeepCollectionEquality()
                .equals(other._imageMetadataList, _imageMetadataList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, queryType,
      const DeepCollectionEquality().hash(_imageMetadataList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryResponseImplCopyWith<_$QueryResponseImpl> get copyWith =>
      __$$QueryResponseImplCopyWithImpl<_$QueryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryResponseImplToJson(
      this,
    );
  }
}

abstract class _QueryResponse implements QueryResponse {
  factory _QueryResponse(
          {@JsonKey(
              name: 'created_at',
              fromJson: _datetimeFromJson,
              toJson: _datetimeToJson)
          required final DateTime createdAt,
          required final QueryType queryType,
          required final List<AppImageMetadata> imageMetadataList}) =
      _$QueryResponseImpl;

  factory _QueryResponse.fromJson(Map<String, dynamic> json) =
      _$QueryResponseImpl.fromJson;

  @override
  @JsonKey(
      name: 'created_at', fromJson: _datetimeFromJson, toJson: _datetimeToJson)
  DateTime get createdAt;
  @override
  QueryType get queryType;
  @override
  List<AppImageMetadata> get imageMetadataList;
  @override
  @JsonKey(ignore: true)
  _$$QueryResponseImplCopyWith<_$QueryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
