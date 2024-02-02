import 'package:dio/dio.dart';
import 'package:flutter_web/model/state_model/auth_state.dart';
import 'package:flutter_web/model/state_model/gallery_state.dart';
import 'package:flutter_web/providers/app_auth_provider.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/repository/k8s_auth_repository.dart';
import 'package:flutter_web/repository/k8s_image_repository.dart';
import 'package:flutter_web/utils/dio_interceptor.dart';
import 'package:flutter_web/utils/domain.dart';
import 'package:flutter_web/utils/token_manager.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final prefs = await SharedPreferences.getInstance();
  final tokenManager = TokenManager();
  tokenManager.loadTokensFromCookie();
  final username = prefs.getString('username');

  final CustomInterceptor customInterceptor = CustomInterceptor();
  final apiHttpClient = Dio(
    BaseOptions(
      baseUrl: "${DomainManager.apiDomain}/",
    ),
  );
  apiHttpClient.interceptors.add(customInterceptor);
  final authHttpClient = Dio(
    BaseOptions(
      baseUrl: "${DomainManager.authDomain}/",
    ),
  );
  authHttpClient.interceptors.add(customInterceptor);
  final k8sAuthRepo = K8sAuthRepository(httpClient: authHttpClient);
  final authProvider = AppAuthProvider(
      authRepository: k8sAuthRepo,
      initialState: AuthState(
          isSignedIn: tokenManager.idToken != null,
          loading: false,
          username: username));
  final remoteImageRepo = K8sImageRepository(httpClient: apiHttpClient);
  final imageProvider = AppImageProvider(
      imageRepository: remoteImageRepo,
      initialState: GalleryState(
        loading: false,
        imageMetadataList: [],
        selectedMode: false,
        currentImageIndex: 0,
        totalPage: 0,
        currentPage: 0,
      ));
  await authProvider.checkUserSignedIn();

  return [
    ChangeNotifierProvider<AppAuthProvider>(
      create: (_) => authProvider,
    ),
    ChangeNotifierProvider(create: (_) => imageProvider)
  ];
}
