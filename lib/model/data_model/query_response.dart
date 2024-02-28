import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/state_model/search_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_response.freezed.dart';
part 'query_response.g.dart';

@freezed
class QueryResponse with _$QueryResponse {
  factory QueryResponse(
      {@JsonKey(
        name: 'created_at',
        fromJson: _datetimeFromJson,
        toJson: _datetimeToJson,
      )
      required DateTime createdAt,
      required QueryType queryType,
      required List<AppImageMetadata> imageMetadataList}) = _QueryResponse;
  factory QueryResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryResponseFromJson(json);
}

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
