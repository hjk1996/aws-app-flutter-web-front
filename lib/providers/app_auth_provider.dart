import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/event/auth_event.dart';
import 'package:flutter_web/model/repository/auth_repository.dart';
import 'package:flutter_web/model/state_model/auth_state.dart';

class AppAuthProvider with ChangeNotifier {
  AppAuthProvider({required AuthRepository authRepository}) {
    _authRepository = authRepository;
    _state = AuthState(
      loading: false,
      isSignedIn: false,
      user: null,
    );
  }

  late final AuthRepository _authRepository;

  late AuthState _state;
  AuthState get state => _state;

  final _authEventController = StreamController<AuthEvent>.broadcast();
  Stream<AuthEvent> get authEventStream => _authEventController.stream;

  void toggleLoading() {
    _state = _state.copyWith(loading: !_state.loading);
    notifyListeners();
  }

  Future<void> isUserSignedIn() async {
    try {
      toggleLoading();
      final result = await _authRepository.isUserSignedIn();
      _state = _state.copyWith(isSignedIn: result);
    } on Exception catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("something went wrong: $err"));
    } finally {
      toggleLoading();
    }
  }

  Future<void> getCurrentUser() async {
    try {
      toggleLoading();

      final user = await _authRepository.getCurrentUser();
      _state = _state.copyWith(
        user: user,
        isSignedIn: true,
      );
    } on SignedOutException catch (_) {
      _authEventController.sink
          .add(const AuthEvent.error("user not signed in"));
      _state = _state.copyWith(user: null);
    } on Exception catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("something went wrong: $err"));
    } finally {
      toggleLoading();
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      _state = _state.copyWith(email: email);
      toggleLoading();
      final result =
          await _authRepository.signInUser(email: email, password: password);
      _handleSignInResult(result);
    } on InvalidStateException catch (_) {
      await getCurrentUser();
    } on AuthException catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("something went wrong while signing in: $err"));
    } on Exception catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("something went wrong: $err"));
    } finally {
      toggleLoading();
    }
  }

  Future<void> signUpUser({
    required String username,
    required String password,
    required String email,
    String? phoneNumber,
  }) async {
    try {
      toggleLoading();
      final result = await _authRepository.signUpUser(
        username: username,
        password: password,
        email: email,
      );
      print(result);
      _state = _state.copyWith(email: email);
      _handleSignUpResult(result);
    } on AuthException catch (err) {
      print(err);
      _authEventController.sink
          .add(const AuthEvent.error("user not signed in"));
      print("something went wrong while signing up");
    } on Exception catch (err) {
      print(err);
    } finally {
      toggleLoading();
    }
  }

  Future<void> signOut() async {
    try {
      toggleLoading();
      await _authRepository.signOut();
      _state = _state.copyWith(isSignedIn: false, user: null);
    } on Exception catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("something went wrong: $err"));
    } finally {
      toggleLoading();
    }
  }

  Future<void> confirmUser({
    required String confirmationCode,
  }) async {
    try {
      toggleLoading();
      final result = await _authRepository.confirmUser(
        email: _state.email!,
        confirmationCode: confirmationCode,
      );
      _handleSignUpResult(result);
    } on AuthException catch (err) {
      print(err);
      _authEventController.sink
          .add(const AuthEvent.error("user not signed in"));
      print("something went wrong while signing up");
    } on Exception catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("something went wrong: $err"));
      print(err);
    } finally {
      toggleLoading();
    }
  }

  Future<void> resendSignUpCode() async {
    try {
      toggleLoading();
      await _authRepository.sendEmailVerificationCode(
        email: _state.email!,
      );
    } on AuthException catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("failed to resend code: $err"));
    } on Exception catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("something went wrong: $err"));
    } finally {
      toggleLoading();
    }
  }

  Future<void> _handleSignInResult(SignInResult result) async {
    switch (result.nextStep.signInStep) {
      case AuthSignInStep.confirmSignUp:
        await resendSignUpCode();
        _authEventController.sink.add(const AuthEvent.confirmSignUp());
        break;
      case AuthSignInStep.done:
        await getCurrentUser();
        _authEventController.sink.add(const AuthEvent.onSignInSuccess());
        break;
      default:
        break;
    }
  }

  Future<void> _handleSignUpResult(SignUpResult result) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        _authEventController.sink.add(
            AuthEvent.onCodeDelivery(result.nextStep.codeDeliveryDetails!));
        break;
      case AuthSignUpStep.done:
        _authEventController.sink.add(const AuthEvent.onSignUpSuccess());
        break;
    }
  }
}
