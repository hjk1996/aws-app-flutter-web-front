import 'package:freezed_annotation/freezed_annotation.dart';


part 'sign_in_result.freezed.dart';
part 'sign_in_result.g.dart';


@freezed
class SignInResult with _$SignInResult {
  factory SignInResult({
    required String accessToken,
    required String idToken,
    required String refreshToken,
    required String username,
    
  }) = _SignInResult;
  factory SignInResult.fromJson(Map<String, dynamic> json) =>
    _$SignInResultFromJson(json);
}