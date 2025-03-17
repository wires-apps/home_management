import 'package:dio/dio.dart';
import 'package:home_management/core/res/constants.dart';

class AuthDio {
  final Dio dio;

  AuthDio({
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
