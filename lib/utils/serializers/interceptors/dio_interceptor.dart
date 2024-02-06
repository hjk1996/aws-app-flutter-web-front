import 'package:dio/dio.dart';
import 'package:flutter_web/utils/token_manager.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var tokenManager = TokenManager();
    options.headers['Authorization'] = tokenManager.accessToken;
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    switch (err.response?.statusCode) {
      case 401:
        var tokenManager = TokenManager();
        if (tokenManager.refreshToken == null || tokenManager.idToken == null) {
          print("로그인 필요");
          return handler.next(err);
        }
        await tokenManager.renewTokens();
      default:
        print("에러 발생: [${err.response?.statusCode}]: ${err.response?.data}");
        return handler.next(err);
    }
  }
}
