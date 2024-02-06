import 'package:dio/dio.dart';
import 'package:flutter_web/model/data_model/sign_in_result.dart';
import 'package:flutter_web/model/repository/auth_repository.dart';
import 'package:flutter_web/utils/token_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class K8sAuthRepository implements AuthRepository {
  const K8sAuthRepository({required Dio httpClient}) : _httpClient = httpClient;
  final Dio _httpClient;

  @override
  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    _httpClient.options.headers['Content-Type'] = 'application/json';
    print(_httpClient.options.baseUrl);
    final response = await _httpClient.post(
      '/signup',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> confirmUser({
    required String email,
    required String code,
  }) async {
    _httpClient.options.headers['Content-Type'] = 'application/json';
    final response = await _httpClient.post(
      '/email',
      data: {
        'email': email,
        'code': code,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> signIn({required String email, required String password}) async {
    _httpClient.options.headers['Content-Type'] = 'application/json';
    final response = await _httpClient.post(
      '/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final res = response.data["result"];
      final signInResult = SignInResult.fromJson(res);
      var tokenManager = TokenManager();
      tokenManager.setTokenCookies(signInResult);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> signOut() async {
    _httpClient.options.headers['Content-Type'] = 'application/json';
    final response = await _httpClient.post(
      '/logout',
    );

    if (response.statusCode == 200) {
      var tokenManager = TokenManager();
      tokenManager.clear();

      final prefs = await SharedPreferences.getInstance();

      await Future.wait([
        prefs.remove("username"),
        prefs.remove("accessToken"),
        prefs.remove("idToken"),
        prefs.remove("refreshToken"),
      ]);

      return true;
    } else {
      return false;
    }
  }
}
