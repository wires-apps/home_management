import 'package:home_management/features/auth/repository/auth_local_repository.dart';

import '../repository/auth_remote_repository.dart';

class AuthInteractor {
  const AuthInteractor(
    this._authRemoteRepository,
    this._authLocalRepository,
  );

  final AuthRemoteRepository _authRemoteRepository;
  final AuthLocalRepository _authLocalRepository;

  /// Вход через СМС (логин)
  // Future<Either<Failure, String>> signInWithSms(String phoneNumber, String smsCode) async {
  //   final result = await _remoteDataSource.signInWithSms(phoneNumber, smsCode);
  //
  //   return result.fold(
  //     (failure) => Left(failure),
  //     (token) async {
  //       await _localDataSource.saveToken(token); // Сохранение токена в локальное хранилище
  //       return Right(token);
  //     },
  //   );
  // }

  /// Проверка, есть ли сохранённый токен
  // Future<bool> isUserLoggedIn() async {
  //   final token = await _localDataSource.getToken();
  //   return token != null;
  // }

  /// Выход из аккаунта (удаление токена)
  // Future<void> logOut() async {
  //   await _localDataSource.clearToken();
  // }
}
