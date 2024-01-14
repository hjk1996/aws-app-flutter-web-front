import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_web/providers/app_auth_provider.dart';
import 'package:flutter_web/repository/auth_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final amplifyAuth = Amplify.Auth;
  final authRepo = AuthRepository(amplifyAuth: amplifyAuth);
  final authProvider = AppAuthProvider(authRepository: authRepo);
  await authProvider.getCurrentUser();

  return [
    ChangeNotifierProvider<AppAuthProvider>(
      create: (_) => authProvider,
    ),
  ];
}
