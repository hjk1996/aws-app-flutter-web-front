import 'package:amplify_flutter/amplify_flutter.dart';

abstract class AuthRepository {
  Future<bool> isUserSignedIn();

  Future<AuthUser> getCurrentUser();

  Future<SignUpResult> signUpUser({
    required String username,
    required String password,
    required String email,
    String? phoneNumber,
  });

  Future<SignUpResult> confirmUser({
    required String email,
    required String confirmationCode,
  });

  Future<SignInResult> signInUser(
      {required String email, required String password});

  Future<ResendSignUpCodeResult> sendEmailVerificationCode(
      {required String email});

  Future<SignOutResult> signOut();
}
