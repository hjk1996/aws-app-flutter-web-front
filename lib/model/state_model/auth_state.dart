import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required bool loading,
    required bool isSignedIn,
    required AuthUser? user,
    String? email,
  }) = _AuthState;
}
