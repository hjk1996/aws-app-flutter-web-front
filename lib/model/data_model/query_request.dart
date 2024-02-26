

import 'package:flutter_web/model/state_model/search_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'query_request.freezed.dart';
part 'query_request.g.dart';




@freezed
class QueryRequest  with _$QueryRequest{
  factory QueryRequest(
    {
      required String query,
      required QueryType queryType,
      @JsonKey(
        name: 'created_at',
        fromJson: _datetimeFromJson,
        toJson: _datetimeToJson,
      ) required DateTime createdAt,

    }
  ) = _QueryRequest;
  factory QueryRequest.fromJson(Map<String, dynamic> json) =>
    _$QueryRequestFromJson(json);
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
