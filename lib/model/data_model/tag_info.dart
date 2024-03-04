import 'package:freezed_annotation/freezed_annotation.dart';


part 'tag_info.freezed.dart';
part 'tag_info.g.dart';


@freezed
class TagInfo with _$TagInfo {
  factory TagInfo({
    required String tag,
    required int count,
  }) = _TagInfo;
  factory TagInfo.fromJson(Map<String, dynamic> json) =>
    _$TagInfoFromJson(json);
}