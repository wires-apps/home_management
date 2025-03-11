
abstract class AuthLocalRepository {
  const AuthLocalRepository();

  Future<String?> getSessionToken();
  Future<void> saveSessionToken(String sessionToken);
  Future<bool> hasSessionToken();
  // Future<User?> getUser();
  // Future<void> saveUser(User user);
  Future<bool> hasUser();
  Future<void> savePinCode(String pinCode);
  Future<bool> validatePinCode(String pinCode);
  Future<String?> getPinCode();
  Future<void> saveBaseUrl(String baseUrl);
  Future<String> getBaseUrl();
  Future<void> clear();
  Future<void> saveUsername(String username);
  Future<String?> getUsername();
}
