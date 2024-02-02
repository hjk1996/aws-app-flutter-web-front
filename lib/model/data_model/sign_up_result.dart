import 'package:freezed_annotation/freezed_annotation.dart';


part 'sign_up_result.freezed.dart';
part 'sign_up_result.g.dart';


@freezed
class SignUpResult with _$SignUpResult {
  factory SignUpResult({
    required String username,
    required String id,
    required bool success,
  }) = _SignUpResult;
  factory SignUpResult.fromJson(Map<String, dynamic> json) =>
    _$SignUpResultFromJson(json);
}