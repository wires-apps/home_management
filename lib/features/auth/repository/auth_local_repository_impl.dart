import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_management/core/res/constants.dart';

import 'auth_local_repository.dart';

const _sessionKey = 'auth_session_key';
const _userEmailKey = 'auth_user_email_key';
const _userPasswordKey = 'auth_user_password_key';
const _pinCodeKey = 'auth_pin_code_key';
const _baseUrlKey = 'base_url_key';
const _usernameKey = 'username_key';

class AuthLocalRepositoryImpl extends AuthLocalRepository {
  const AuthLocalRepositoryImpl(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  @override
  Future<String?> getSessionToken() {
    return _secureStorage.read(key: _sessionKey);
  }

  @override
  Future<void> saveSessionToken(String sessionToken) {
    return _secureStorage.write(key: _sessionKey, value: sessionToken);
  }

  // @override
  // Future<User?> getUser() async {
  //   final email = await _secureStorage.read(key: _userEmailKey);
  //   final password = await _secureStorage.read(key: _userPasswordKey);
  //   if (email == null || password == null) return null;
  //   return User(username: email, password: password);
  // }
  //
  // @override
  // Future<void> saveUser(User user) async {
  //   await _secureStorage.write(key: _userEmailKey, value: user.username);
  //   await _secureStorage.write(key: _userPasswordKey, value: user.password);
  // }

  @override
  Future<void> savePinCode(String pinCode) async {
    await _secureStorage.write(key: _pinCodeKey, value: pinCode);
  }

  @override
  Future<bool> validatePinCode(String pinCode) async {
    final localPinCode = await _secureStorage.read(key: _pinCodeKey);
    return localPinCode == pinCode;
  }

  @override
  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }

  @override
  Future<bool> hasSessionToken() async {
    return await _secureStorage.read(key: _sessionKey) != null;
  }

  @override
  Future<bool> hasUser() async {
    return await _secureStorage.read(key: _userEmailKey) != null &&
        await _secureStorage.read(key: _userPasswordKey) != null;
  }

  @override
  Future<String?> getPinCode() async {
    return await _secureStorage.read(key: _pinCodeKey);
  }

  @override
  Future<void> saveBaseUrl(String baseUrl) async {
    await _secureStorage.write(key: _baseUrlKey, value: baseUrl);
  }

  @override
  Future<String> getBaseUrl() async {
    return await _secureStorage.read(key: _baseUrlKey) ?? baseUrl;
  }

  @override
  Future<void> saveUsername(String username) async {
    await _secureStorage.write(key: _usernameKey, value: username);
  }

  @override
  Future<String?> getUsername() async {
    return await _secureStorage.read(key: _usernameKey);
  }
}
