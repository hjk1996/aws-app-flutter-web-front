import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// Amplify Flutter Packages
import 'package:flutter_web/di.dart';
import 'package:flutter_web/providers/app_auth_provider.dart';
import 'package:flutter_web/screen/email_verification/email_verification_screen.dart';
import 'package:flutter_web/screen/gallery/gallery_screen.dart';
import 'package:flutter_web/screen/home/home_screen.dart';
import 'package:flutter_web/screen/search/search_screen.dart';
import 'package:flutter_web/screen/setting/setting_screen.dart';
import 'package:flutter_web/screen/sign_in/sign_in_screen.dart';
import 'package:flutter_web/screen/sign_up/sign_up_screen.dart';
import 'package:provider/provider.dart';

// Generated in previous step
// import 'amplifyconfiguration.dart';

void main() async {
  // await _configureAmplify();
  final providers = await getProviders();

  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ));
}

// Future<void> _configureAmplify() async {
//   // Add any Amplify plugins you want to use
//   final authPlugin = AmplifyAuthCognito();
//   await Amplify.addPlugin(authPlugin);

//   // You can use addPlugins if you are going to be adding multiple plugins
//   // await Amplify.addPlugins([authPlugin, analyticsPlugin]);

//   // Once Plugins are added, configure Amplify
//   // Note: Amplify can only be configured once.
//   try {
//     await Amplify.configure(amplifyconfig);
//   } on AmplifyAlreadyConfiguredException {
//     safePrint(
//         "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Photo Query',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        SignInScreen.routeName: (context) => const SignInScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        EmailVerificationScreen.routeName: (context) =>
            EmailVerificationScreen(),
        GalleryScreen.routeName: (context) => const GalleryScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
        SettingScreen.routeName: (context) => const SettingScreen(),
      },
      home: const AuthWrapper(),
      builder: EasyLoading.init(),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppAuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.state.isSignedIn) {
          return const HomeScreen();
        } else {
          return const SignInScreen();
        }
      },
    );
  }
}
