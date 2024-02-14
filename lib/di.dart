import 'package:dio/dio.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/repository/search_repository.dart';
import 'package:flutter_web/model/state_model/auth_state.dart';
import 'package:flutter_web/model/state_model/gallery_state.dart';
import 'package:flutter_web/providers/app_auth_provider.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/repository/k8s/k8s_auth_repository.dart';
import 'package:flutter_web/repository/k8s/k8s_image_repository.dart';
import 'package:flutter_web/repository/k8s/k8s_search_repository.dart';
import 'package:flutter_web/utils/serializers/interceptors/dio_interceptor.dart';
import 'package:flutter_web/utils/domain.dart';
import 'package:flutter_web/utils/serializers/interceptors/s3_interceptor.dart';
import 'package:flutter_web/utils/token_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final prefs = await SharedPreferences.getInstance();
  final getIt = GetIt.instance;
  final tokenManager = TokenManager();
  tokenManager.loadTokensFromCookie();
  final username = prefs.getString('username');

  final CustomInterceptor authInterceptor = CustomInterceptor();
  final CustomInterceptor apiInterceptor = CustomInterceptor();
  final S3Interceptor s3Interceptor = S3Interceptor();
  final apiHttpClient = Dio(
    BaseOptions(
      baseUrl: "${DomainManager.apiDomain}/",
    ),
  );
  final s3HttpClient = Dio(
    BaseOptions(
      baseUrl: "${DomainManager.s3Domain}/",
    ),
  );
  apiHttpClient.interceptors.add(apiInterceptor);

  s3HttpClient.interceptors.add(s3Interceptor);

  final authHttpClient = Dio(
    BaseOptions(
      baseUrl: "${DomainManager.authDomain}/",
    ),
  );
  authHttpClient.interceptors.add(authInterceptor);
  final k8sAuthRepo = K8sAuthRepository(httpClient: authHttpClient);
  final authProvider = AppAuthProvider(
      authRepository: k8sAuthRepo,
      initialState: AuthState(
          isSignedIn: tokenManager.idToken != null,
          loading: false,
          username: username));
  final k8sRemoteImageRepo = K8sImageRepository(
    apiHttpClient: apiHttpClient,
    s3HttpClient: s3HttpClient,
    tokenManager: tokenManager,
  );

  getIt.registerSingleton<ImageRepository>(k8sRemoteImageRepo);

  final k8sSearchRepo = K8sSearchRepository(
      apiHttpClient: apiHttpClient, tokenManager: tokenManager);

  getIt.registerSingleton<SearchRepository>(k8sSearchRepo);

  final imageProvider = AppImageProvider(
      imageRepository: k8sRemoteImageRepo,
      initialState: GalleryState(
        loading: false,
        currentImageIndex: 0,
        selectMode: false,
        totalPage: 0,
        currentPage: 0,
      ));
  imageProvider.init();
  await authProvider.checkUserSignedIn();

  return [
    ChangeNotifierProvider<AppAuthProvider>(
      create: (_) => authProvider,
    ),
    ChangeNotifierProvider<AppImageProvider>(
      create: (_) => imageProvider,
    )
  ];
}
