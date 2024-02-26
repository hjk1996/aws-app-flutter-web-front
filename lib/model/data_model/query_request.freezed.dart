// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QueryRequest _$QueryRequestFromJson(Map<String, dynamic> json) {
  return _QueryRequest.fromJson(json);
}

/// @nodoc
mixin _$QueryRequest {
  String get query => throw _privateConstructorUsedError;
  QueryType get queryType => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'created_at', fromJson: _datetimeFromJson, toJson: _datetimeToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryRequestCopyWith<QueryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryRequestCopyWith<$Res> {
  factory $QueryRequestCopyWith(
          QueryRequest value, $Res Function(QueryRequest) then) =
      _$QueryRequestCopyWithImpl<$Res, QueryRequest>;
  @useResult
  $Res call(
      {String query,
      QueryType queryType,
      @JsonKey(
          name: 'created_at',
          fromJson: _datetimeFromJson,
          toJson: _datetimeToJson)
      DateTime createdAt});
}

/// @nodoc
class _$QueryRequestCopyWithImpl<$Res, $Val extends QueryRequest>
    implements $QueryRequestCopyWith<$Res> {
  _$QueryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? queryType = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      queryType: null == queryType
          ? _value.queryType
          : queryType // ignore: cast_nullable_to_non_nullable
              as QueryType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryRequestImplCopyWith<$Res>
    implements $QueryRequestCopyWith<$Res> {
  factory _$$QueryRequestImplCopyWith(
          _$QueryRequestImpl value, $Res Function(_$QueryRequestImpl) then) =
      __$$QueryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      QueryType queryType,
      @JsonKey(
          name: 'created_at',
          fromJson: _datetimeFromJson,
          toJson: _datetimeToJson)
      DateTime createdAt});
}

/// @nodoc
class __$$QueryRequestImplCopyWithImpl<$Res>
    extends _$QueryRequestCopyWithImpl<$Res, _$QueryRequestImpl>
    implements _$$QueryRequestImplCopyWith<$Res> {
  __$$QueryRequestImplCopyWithImpl(
      _$QueryRequestImpl _value, $Res Function(_$QueryRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? queryType = null,
    Object? createdAt = null,
  }) {
    return _then(_$QueryRequestImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      queryType: null == queryType
          ? _value.queryType
          : queryType // ignore: cast_nullable_to_non_nullable
              as QueryType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryRequestImpl implements _QueryRequest {
  _$QueryRequestImpl(
      {required this.query,
      required this.queryType,
      @JsonKey(
          name: 'created_at',
          fromJson: _datetimeFromJson,
          toJson: _datetimeToJson)
      required this.createdAt});

  factory _$QueryRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryRequestImplFromJson(json);

  @override
  final String query;
  @override
  final QueryType queryType;
  @override
  @JsonKey(
      name: 'created_at', fromJson: _datetimeFromJson, toJson: _datetimeToJson)
  final DateTime createdAt;

  @override
  String toString() {
    return 'QueryRequest(query: $query, queryType: $queryType, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryRequestImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.queryType, queryType) ||
                other.queryType == queryType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, query, queryType, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryRequestImplCopyWith<_$QueryRequestImpl> get copyWith =>
      __$$QueryRequestImplCopyWithImpl<_$QueryRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryRequestImplToJson(
      this,
    );
  }
}

abstract class _QueryRequest implements QueryRequest {
  factory _QueryRequest(
      {required final String query,
      required final QueryType queryType,
      @JsonKey(
          name: 'created_at',
          fromJson: _datetimeFromJson,
          toJson: _datetimeToJson)
      required final DateTime createdAt}) = _$QueryRequestImpl;

  factory _QueryRequest.fromJson(Map<String, dynamic> json) =
      _$QueryRequestImpl.fromJson;

  @override
  String get query;
  @override
  QueryType get queryType;
  @override
  @JsonKey(
      name: 'created_at', fromJson: _datetimeFromJson, toJson: _datetimeToJson)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$QueryRequestImplCopyWith<_$QueryRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
