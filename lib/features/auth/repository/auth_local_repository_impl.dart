import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_local_repository.dart';

const _sessionKey = 'auth_session_key';
const _userIdKey = 'user_id_key';

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

  @override
  Future<num> getUserId() async {
    final id = await _secureStorage.read(key: _userIdKey) ?? '';
    return num.parse(id);
  }

  @override
  Future<void> saveUserId(num sessionToken) {
    return _secureStorage.write(key: _userIdKey, value: sessionToken.toString());
  }

  @override
  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }

  @override
  Future<bool> hasSessionToken() async {
    return await _secureStorage.read(key: _sessionKey) != null;
  }
}
