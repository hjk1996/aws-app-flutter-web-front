import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_web/model/repository/auth_repository.dart';

class AmplifyAuthRepository implements AuthRepository {
  const AmplifyAuthRepository({required AuthCategory amplifyAuth})
      : _amplifyAuth = amplifyAuth;
  final AuthCategory _amplifyAuth;

  @override
  Future<bool> isUserSignedIn() async {
    final result = await _amplifyAuth.fetchAuthSession();
    return result.isSignedIn;
  }

  @override
  Future<AuthUser> getCurrentUser() async {
    final user = await _amplifyAuth.getCurrentUser();
    return user;
  }

  @override
  Future<SignUpResult> signUpUser({
    required String username,
    required String password,
    required String email,
    String? phoneNumber,
  }) async {
    final userAttributes = {
      AuthUserAttributeKey.preferredUsername: username,
      if (phoneNumber != null) AuthUserAttributeKey.phoneNumber: phoneNumber,
      // additional attributes as needed
    };
    return Amplify.Auth.signUp(
      username: email,
      password: password,
      options: SignUpOptions(
        userAttributes: userAttributes,
      ),
    );
  }

  @override
  Future<SignUpResult> confirmUser({
    required String email,
    required String confirmationCode,
  }) async {
    return Amplify.Auth.confirmSignUp(
      username: email,
      confirmationCode: confirmationCode,
    );
  }

  @override
  Future<SignInResult> signInUser(
      {required String email, required String password}) async {
    return Amplify.Auth.signIn(
      username: email,
      password: password,
    );
  }

  @override
  Future<ResendSignUpCodeResult> sendEmailVerificationCode(
      {required String email}) async {
    return Amplify.Auth.resendSignUpCode(username: email);
  }

  @override
  Future<SignOutResult> signOut() async {
    return Amplify.Auth.signOut();
  }
}
