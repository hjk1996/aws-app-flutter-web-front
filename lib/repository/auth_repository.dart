import 'package:amplify_flutter/amplify_flutter.dart';

class AuthRepository {
  const AuthRepository({required AuthCategory amplifyAuth})
      : _amplifyAuth = amplifyAuth;
  final AuthCategory _amplifyAuth;

  Future<bool> isUserSignedIn() async {
    final result = await _amplifyAuth.fetchAuthSession();
    return result.isSignedIn;
  }

  Future<AuthUser> getCurrentUser() async {
    final user = await _amplifyAuth.getCurrentUser();
    return user;
  }

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

  Future<SignUpResult> confirmUser({
    required String email,
    required String confirmationCode,
  }) async {
    return Amplify.Auth.confirmSignUp(
      username: email,
      confirmationCode: confirmationCode,
    );
  }

  Future<SignInResult> signInUser(
      {required String email, required String password}) async {
    return Amplify.Auth.signIn(
      username: email,
      password: password,
    );
  }

  Future<ResendSignUpCodeResult> sendEmailVerificationCode(
      {required String email}) async {
    return Amplify.Auth.resendSignUpCode(username: email);
  }

  Future<SignOutResult> signOut() async {
    return Amplify.Auth.signOut();
  }
}
