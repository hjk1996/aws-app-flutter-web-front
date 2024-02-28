import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_image_metadata.freezed.dart';
part 'app_image_metadata.g.dart';

@freezed
class AppImageMetadata with _$AppImageMetadata {
  factory AppImageMetadata({
    @JsonKey(
      name: 'picture_id',
    )
    required int pictureId,
    @JsonKey(
      name: 'user_id',
    )
    required String userId,
    @JsonKey(
      name: 'image_url',
    )
    required String imageUrl,
    @JsonKey(
      fromJson: _bookmarkedFromJson,
      toJson: _bookmarkedToJson,
    )
    required bool bookmarked,
    @JsonKey(
      name: 'created_at',
      fromJson: _datetimeFromJson,
      toJson: _datetimeToJson,
    )
    required DateTime createdAt,
    String? caption,
  }) = _AppImageMetadata;
  factory AppImageMetadata.fromJson(Map<String, dynamic> json) =>
      _$AppImageMetadataFromJson(json);
}

// Convert from JSON integer to boolean
bool _bookmarkedFromJson(int? bookmarked) => bookmarked == 1;

// Convert from boolean to JSON integer
int _bookmarkedToJson(bool? bookmarked) => bookmarked == true ? 1 : 0;

DateTime _datetimeFromJson(dynamic timestamp) {
  if (timestamp is String) {
    return DateTime.parse(timestamp);
  } else if (timestamp is double) {
    return DateTime.fromMillisecondsSinceEpoch((timestamp * 1000).toInt());
  } else {
    throw Exception(
        'TimestampSerializer: Unknown type: ${timestamp.runtimeType}');
  }
}

String _datetimeToJson(DateTime date) => date.toIso8601String();
