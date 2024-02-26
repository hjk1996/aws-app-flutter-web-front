// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchState _$SearchStateFromJson(Map<String, dynamic> json) {
  return _SearchState.fromJson(json);
}

/// @nodoc
mixin _$SearchState {
  bool get loading => throw _privateConstructorUsedError;
  bool get showQueryTypes => throw _privateConstructorUsedError;
  QueryType get queryType => throw _privateConstructorUsedError;
  List<dynamic> get chatList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {bool loading,
      bool showQueryTypes,
      QueryType queryType,
      List<dynamic> chatList});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? showQueryTypes = null,
    Object? queryType = null,
    Object? chatList = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showQueryTypes: null == showQueryTypes
          ? _value.showQueryTypes
          : showQueryTypes // ignore: cast_nullable_to_non_nullable
              as bool,
      queryType: null == queryType
          ? _value.queryType
          : queryType // ignore: cast_nullable_to_non_nullable
              as QueryType,
      chatList: null == chatList
          ? _value.chatList
          : chatList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool showQueryTypes,
      QueryType queryType,
      List<dynamic> chatList});
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? showQueryTypes = null,
    Object? queryType = null,
    Object? chatList = null,
  }) {
    return _then(_$SearchStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showQueryTypes: null == showQueryTypes
          ? _value.showQueryTypes
          : showQueryTypes // ignore: cast_nullable_to_non_nullable
              as bool,
      queryType: null == queryType
          ? _value.queryType
          : queryType // ignore: cast_nullable_to_non_nullable
              as QueryType,
      chatList: null == chatList
          ? _value._chatList
          : chatList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchStateImpl implements _SearchState {
  _$SearchStateImpl(
      {required this.loading,
      required this.showQueryTypes,
      required this.queryType,
      required final List<dynamic> chatList})
      : _chatList = chatList;

  factory _$SearchStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchStateImplFromJson(json);

  @override
  final bool loading;
  @override
  final bool showQueryTypes;
  @override
  final QueryType queryType;
  final List<dynamic> _chatList;
  @override
  List<dynamic> get chatList {
    if (_chatList is EqualUnmodifiableListView) return _chatList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatList);
  }

  @override
  String toString() {
    return 'SearchState(loading: $loading, showQueryTypes: $showQueryTypes, queryType: $queryType, chatList: $chatList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.showQueryTypes, showQueryTypes) ||
                other.showQueryTypes == showQueryTypes) &&
            (identical(other.queryType, queryType) ||
                other.queryType == queryType) &&
            const DeepCollectionEquality().equals(other._chatList, _chatList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, loading, showQueryTypes,
      queryType, const DeepCollectionEquality().hash(_chatList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchStateImplToJson(
      this,
    );
  }
}

abstract class _SearchState implements SearchState {
  factory _SearchState(
      {required final bool loading,
      required final bool showQueryTypes,
      required final QueryType queryType,
      required final List<dynamic> chatList}) = _$SearchStateImpl;

  factory _SearchState.fromJson(Map<String, dynamic> json) =
      _$SearchStateImpl.fromJson;

  @override
  bool get loading;
  @override
  bool get showQueryTypes;
  @override
  QueryType get queryType;
  @override
  List<dynamic> get chatList;
  @override
  @JsonKey(ignore: true)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
