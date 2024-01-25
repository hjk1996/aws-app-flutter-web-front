import 'package:json_annotation/json_annotation.dart';

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();

  @override
  DateTime fromJson(dynamic timestamp) {
    if (timestamp is String) {
      return DateTime.parse(timestamp);
    } else if (timestamp is double) {
      return DateTime.fromMillisecondsSinceEpoch((timestamp * 1000).toInt());
    } else {
      throw Exception(
          'TimestampSerializer: Unknown type: ${timestamp.runtimeType}');
    }
  }

  @override
  String toJson(DateTime date) => date.toIso8601String();
}
