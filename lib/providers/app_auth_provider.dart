import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web/event/auth_event.dart';
import 'package:flutter_web/model/repository/auth_repository.dart';
import 'package:flutter_web/model/state_model/auth_state.dart';
import 'package:flutter_web/utils/token_manager.dart';

class AppAuthProvider with ChangeNotifier {
  AppAuthProvider(
      {required AuthRepository authRepository,
      required AuthState initialState}) {
    _authRepository = authRepository;
    _state = initialState;
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

  Future<void> checkUserSignedIn() async {
    try {
      var tokenManager = TokenManager();
      tokenManager.loadTokensFromCookie();
      if (tokenManager.refreshToken == null || tokenManager.idToken == null) {
        _state = _state.copyWith(isSignedIn: false);
        return;
      } else {
        await tokenManager.renewTokens();
        _state = _state.copyWith(isSignedIn: true);
        return;
      }
    } on Exception catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("something went wrong: $err"));
    } finally {}
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      _state = _state.copyWith(username: email);
      toggleLoading();
      final ok = await _authRepository.signIn(email: email, password: password);
      print(ok);

      if (ok) {
        _state = _state.copyWith(isSignedIn: true);
        notifyListeners();
        _authEventController.sink.add(const AuthEvent.onSignInSuccess());
      } else {
        _authEventController.sink
            .add(const AuthEvent.error("user not signed in"));
      }
    } on Exception catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("something went wrong: $err"));
    } finally {
      toggleLoading();
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      toggleLoading();
      _state = _state.copyWith(username: email);
      final ok = await _authRepository.signUp(
        email: email,
        password: password,
      );

      if (ok) {
        _authEventController.sink.add(const AuthEvent.onSignUpSuccess());
      } else {
        _authEventController.sink
            .add(const AuthEvent.error("user not signed in"));
      }
    } on Exception catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("something went wrong: $err"));
    } finally {
      toggleLoading();
    }
  }

  Future<void> signOut() async {
    try {
      toggleLoading();
      await _authRepository.signOut();
      _state = _state.copyWith(isSignedIn: false);
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
      final ok = await _authRepository.confirmUser(
        email: _state.username!,
        code: confirmationCode,
      );
      if (ok) {
        _authEventController.sink.add(const AuthEvent.onConfirmUserSuccess());
      } else {
        _authEventController.sink
            .add(const AuthEvent.error("user not signed in"));
      }
    } on Exception catch (err) {
      _authEventController.sink
          .add(AuthEvent.error("something went wrong: $err"));
      print(err);
    } finally {
      toggleLoading();
    }
  }
}
