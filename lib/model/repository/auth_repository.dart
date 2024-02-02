
abstract class AuthRepository {
  Future<bool> signUp({
    required String email,
    required String password,
  });

  Future<bool> confirmUser({
    required String email,
    required String code,
  });

  Future<bool> signIn(
      {required String email, required String password});

  Future<bool> signOut();
}
