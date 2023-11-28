abstract class AuthService {
  Future signInWithEmail(
      {required String email, required String password}) async {}

  Future signUpWithEmail(
      {required String email, required String password}) async {}

  Future resetPassword({required String password}) async {}

  Future resetPasswordRequest({required String email}) async {}

  Future signOut() async {}

  Future signInAnonymously() async {}

  dynamic get user;
}
