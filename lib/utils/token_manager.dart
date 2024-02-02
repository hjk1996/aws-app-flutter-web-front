import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_web/model/data_model/sign_in_result.dart';
import 'package:flutter_web/utils/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html' as html;

enum TokenType { access, id, refresh }

class TokenManager {
  static final TokenManager _instance = TokenManager._internal();
  final Dio _tokenDio = Dio();

  String? _accessToken;
  String? _idToken;
  String? _refreshToken;

  factory TokenManager() {
    return _instance;
  }

  TokenManager._internal();

  String? get accessToken => _accessToken;
  String? get idToken => _idToken;
  String? get refreshToken => _refreshToken;

  set accessToken(String? token) {
    _accessToken = token;
  }

  set idToken(String? token) {
    _idToken = token;
  }

  set refreshToken(String? token) {
    _refreshToken = token;
  }

  void clear() {
    _accessToken = null;
    _idToken = null;
    _refreshToken = null;
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
        if (key == 'access_token') {
          accessToken = value;
        } else if (key == 'id_token') {
          idToken = value;
        } else if (key == 'refresh_token') {
          refreshToken = value;
        }
      }
    }
  }

  void setTokenCookies(SignInResult signInResult) {
    accessToken = signInResult.accessToken;
    idToken = signInResult.idToken;
    refreshToken = signInResult.refreshToken;
    final expiryDate = DateTime.now().add(Duration(days: 1));
    final expires = '; expires=${expiryDate.toUtc().toIso8601String()}';
    // set cookies from signInResult
    html.window.document
      ..cookie = 'access_token=${signInResult.accessToken}$expires'
      ..cookie = 'id_token=${signInResult.idToken}$expires'
      ..cookie = 'refresh_token=${signInResult.refreshToken}$expires';
  }
}
