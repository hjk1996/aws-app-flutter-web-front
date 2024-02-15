import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.error(String e) = AuthEventError;
  const factory AuthEvent.loading() = AuthEventLoading;
  const factory AuthEvent.loaded() = AuthEventtLoaded;

  const factory AuthEvent.onSignUpSuccess() = AuthEventSignUpSuccess;
  const factory AuthEvent.onSignInSuccess() = AuthEventSignInSuccess;
  const factory AuthEvent.onConfirmUserSuccess() = AuthEventConfirmUserSuccess;
  const factory AuthEvent.confirmSignUp() = AuthEventConfirmSignUp;
}
