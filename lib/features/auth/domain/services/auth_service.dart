
abstract class AuthService {
  Future<String> login(UserCredentialsAuthService loginCred); // must return token

  Future<void> register(UserCredentialsAuthService registerCred);
}