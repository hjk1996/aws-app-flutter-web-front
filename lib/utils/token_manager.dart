import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_web/model/data_model/sign_in_result.dart';
import 'package:flutter_web/utils/domain.dart';
import 'dart:html' as html;

enum TokenType { access, id, refresh }

class TokenManager {
  static final TokenManager _instance = TokenManager._internal();
  final Dio _tokenDio = Dio();

  String? _accessToken;
  String? _idToken;
  String? _refreshToken;
  String? _userId;

  factory TokenManager() {
    return _instance;
  }

  TokenManager._internal();

  String? get accessToken => _accessToken;
  String? get idToken => _idToken;
  String? get refreshToken => _refreshToken;
  String? get userId => _userId;

  set accessToken(String? token) {
    _accessToken = token;
  }

  set idToken(String? token) {
    _idToken = token;
  }

  set refreshToken(String? token) {
    _refreshToken = token;
  }

  set userId(String? id) {
    _userId = id;
  }

  void clear() {
    _accessToken = null;
    _idToken = null;
    _refreshToken = null;
    _userId = null;

    // clear cookies
    html.window.document
      ..cookie =
          'access_token=; expires=${DateTime.now().toUtc().toIso8601String()}'
      ..cookie =
          'id_token=; expires=${DateTime.now().toUtc().toIso8601String()}'
      ..cookie =
          'refresh_token=; expires=${DateTime.now().toUtc().toIso8601String()}'
      ..cookie =
          'user_id=; expires=${DateTime.now().toUtc().toIso8601String()}';
  }

  Map<String, dynamic> _parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = base64Url.normalize(parts[1]);
    final decoded = utf8.decode(base64Url.decode(payload));
    final payloadMap = json.decode(decoded);

    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload');
    }

    return payloadMap;
  }

  Map<String, dynamic> getDecodedToken(TokenType tokenType) {
    final token = tokenType == TokenType.access
        ? accessToken
        : tokenType == TokenType.id
            ? idToken
            : refreshToken;

    if (token == null) {
      throw Exception('Token is null');
    }

    return _parseJwt(token);
  }

  Future<void> renewTokens() async {
    try {
      print("토큰 갱신");

      if (refreshToken == null || idToken == null) {
        throw Exception("You need to login");
      }

      final decodedIdToken = _parseJwt(idToken!);
      final email = decodedIdToken['email'];

      var response = await _tokenDio.post(
        "${DomainManager.authDomain}/token",
        data: {
          'email': email,
          'refresh_token': refreshToken,
        },
      );
      accessToken = response.data['access_token'];
      idToken = response.data['id_token'];
      refreshToken = response.data['refresh_token'];
    } catch (e) {
      print(e);
    }
  }

  void loadTokensFromCookie() {
    if (html.window.document.cookie == null) {
      return;
    }

    final cookies = html.window.document.cookie!.split(';');
    for (var cookie in cookies) {
      final keyValue = cookie.split('=');
      if (keyValue.length == 2) {
        final key = keyValue[0].trim();
        final value = keyValue[1].trim();
        if (key == 'access_token' && value.isNotEmpty) {
          accessToken = value;
        } else if (key == 'id_token' && value.isNotEmpty) {
          idToken = value;
        } else if (key == 'refresh_token' && value.isNotEmpty) {
          refreshToken = value;
        } else if (key == 'user_id' && value.isNotEmpty) {
          _userId = value;
        }
      }
    }
  }

  void setTokenCookies(SignInResult signInResult) {
    accessToken = signInResult.accessToken;
    idToken = signInResult.idToken;
    refreshToken = signInResult.refreshToken;
    final decodedIdToken = _parseJwt(signInResult.idToken);
    final userIdFromToken = decodedIdToken['cognito:username'];
    userId = userIdFromToken;
    final expiryDate = DateTime.now().add(const Duration(days: 1));
    final expires = '; expires=${expiryDate.toUtc().toIso8601String()}';
    // set cookies from signInResult
    html.window.document
      ..cookie = 'access_token=${signInResult.accessToken}$expires'
      ..cookie = 'id_token=${signInResult.idToken}$expires'
      ..cookie = 'refresh_token=${signInResult.refreshToken}$expires'
      ..cookie = 'user_id=$userIdFromToken$expires';
  }
}
