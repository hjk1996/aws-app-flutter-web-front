import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_web/providers/app_auth_provider.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/repository/amplify_auth_repository.dart';
import 'package:flutter_web/repository/local_image_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final amplifyAuth = Amplify.Auth;
  final authRepo = AmplifyAuthRepository(amplifyAuth: amplifyAuth);
  final authProvider = AppAuthProvider(authRepository: authRepo);
  final imageRepo = LocalImageRepository();
  final imageProvider = AppImageProvider(imageRepository: imageRepo);

  await authProvider.getCurrentUser();

  return [
    ChangeNotifierProvider<AppAuthProvider>(
      create: (_) => authProvider,
    ),
    ChangeNotifierProvider(create: (_) => imageProvider)
  ];
}
