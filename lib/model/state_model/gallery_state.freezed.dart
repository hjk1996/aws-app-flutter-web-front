// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GalleryState {
  bool get loading => throw _privateConstructorUsedError;
  List<ImageMetadata> get imageMetadataList =>
      throw _privateConstructorUsedError;
  bool get selectedMode => throw _privateConstructorUsedError;
  int get totalPage => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int? get currentImageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryStateCopyWith<GalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryStateCopyWith<$Res> {
  factory $GalleryStateCopyWith(
          GalleryState value, $Res Function(GalleryState) then) =
      _$GalleryStateCopyWithImpl<$Res, GalleryState>;
  @useResult
  $Res call(
      {bool loading,
      List<ImageMetadata> imageMetadataList,
      bool selectedMode,
      int totalPage,
      int currentPage,
      int? currentImageIndex});
}

/// @nodoc
class _$GalleryStateCopyWithImpl<$Res, $Val extends GalleryState>
    implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? imageMetadataList = null,
    Object? selectedMode = null,
    Object? totalPage = null,
    Object? currentPage = null,
    Object? currentImageIndex = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      imageMetadataList: null == imageMetadataList
          ? _value.imageMetadataList
          : imageMetadataList // ignore: cast_nullable_to_non_nullable
              as List<ImageMetadata>,
      selectedMode: null == selectedMode
          ? _value.selectedMode
          : selectedMode // ignore: cast_nullable_to_non_nullable
              as bool,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentImageIndex: freezed == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryStateImplCopyWith<$Res>
    implements $GalleryStateCopyWith<$Res> {
  factory _$$GalleryStateImplCopyWith(
          _$GalleryStateImpl value, $Res Function(_$GalleryStateImpl) then) =
      __$$GalleryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<ImageMetadata> imageMetadataList,
      bool selectedMode,
      int totalPage,
      int currentPage,
      int? currentImageIndex});
}

/// @nodoc
class __$$GalleryStateImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$GalleryStateImpl>
    implements _$$GalleryStateImplCopyWith<$Res> {
  __$$GalleryStateImplCopyWithImpl(
      _$GalleryStateImpl _value, $Res Function(_$GalleryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? imageMetadataList = null,
    Object? selectedMode = null,
    Object? totalPage = null,
    Object? currentPage = null,
    Object? currentImageIndex = freezed,
  }) {
    return _then(_$GalleryStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      imageMetadataList: null == imageMetadataList
          ? _value._imageMetadataList
          : imageMetadataList // ignore: cast_nullable_to_non_nullable
              as List<ImageMetadata>,
      selectedMode: null == selectedMode
          ? _value.selectedMode
          : selectedMode // ignore: cast_nullable_to_non_nullable
              as bool,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentImageIndex: freezed == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GalleryStateImpl extends _GalleryState {
  _$GalleryStateImpl(
      {required this.loading,
      required final List<ImageMetadata> imageMetadataList,
      required this.selectedMode,
      required this.totalPage,
      required this.currentPage,
      this.currentImageIndex})
      : _imageMetadataList = imageMetadataList,
        super._();

  @override
  final bool loading;
  final List<ImageMetadata> _imageMetadataList;
  @override
  List<ImageMetadata> get imageMetadataList {
    if (_imageMetadataList is EqualUnmodifiableListView)
      return _imageMetadataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageMetadataList);
  }

  @override
  final bool selectedMode;
  @override
  final int totalPage;
  @override
  final int currentPage;
  @override
  final int? currentImageIndex;

  @override
  String toString() {
    return 'GalleryState(loading: $loading, imageMetadataList: $imageMetadataList, selectedMode: $selectedMode, totalPage: $totalPage, currentPage: $currentPage, currentImageIndex: $currentImageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._imageMetadataList, _imageMetadataList) &&
            (identical(other.selectedMode, selectedMode) ||
                other.selectedMode == selectedMode) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.currentImageIndex, currentImageIndex) ||
                other.currentImageIndex == currentImageIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_imageMetadataList),
      selectedMode,
      totalPage,
      currentPage,
      currentImageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryStateImplCopyWith<_$GalleryStateImpl> get copyWith =>
      __$$GalleryStateImplCopyWithImpl<_$GalleryStateImpl>(this, _$identity);
}

abstract class _GalleryState extends GalleryState {
  factory _GalleryState(
      {required final bool loading,
      required final List<ImageMetadata> imageMetadataList,
      required final bool selectedMode,
      required final int totalPage,
      required final int currentPage,
      final int? currentImageIndex}) = _$GalleryStateImpl;
  _GalleryState._() : super._();

  @override
  bool get loading;
  @override
  List<ImageMetadata> get imageMetadataList;
  @override
  bool get selectedMode;
  @override
  int get totalPage;
  @override
  int get currentPage;
  @override
  int? get currentImageIndex;
  @override
  @JsonKey(ignore: true)
  _$$GalleryStateImplCopyWith<_$GalleryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
