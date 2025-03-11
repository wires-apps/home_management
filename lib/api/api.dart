import 'package:dio/dio.dart';
import 'package:home_management/core/res/constants.dart';
import 'package:home_management/features/auth/repository/auth_local_repository.dart';

class MainDio {
  final Dio dio;
  final AuthLocalRepository _authLocalRepository;

  MainDio(
    this._authLocalRepository, {
    Dio? dio,
    List<Interceptor>? interceptors,
  }) : dio = dio ??
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 30),
                receiveTimeout: const Duration(seconds: 30),
              ),
            ) {
    setCurrentBaseUrl();
    if (interceptors != null) {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setCurrentBaseUrl() async {
    dio.options.baseUrl = baseUrl;
  }
}
