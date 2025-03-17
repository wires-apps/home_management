
abstract class AuthLocalRepository {
  const AuthLocalRepository();

  Future<String?> getSessionToken();
  Future<num> getUserId();
  Future<void> saveSessionToken(String sessionToken);
  Future<void> saveUserId(num sessionToken);
  Future<bool> hasSessionToken();
  Future<void> clear();
}
