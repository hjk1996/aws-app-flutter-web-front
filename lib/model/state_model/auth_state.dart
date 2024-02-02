import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required bool loading,
    required bool isSignedIn,
    String? username,
  }) = _AuthState;
}
