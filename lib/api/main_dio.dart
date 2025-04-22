import 'package:dio/dio.dart';
import 'package:home_management/core/res/constants.dart';

class MainDio {
  final Dio dio;

  MainDio({
    Dio? dio,
    List<Interceptor>? interceptors,
  }) : dio = dio ??
            Dio(
              BaseOptions(
                followRedirects: false,
                validateStatus: (status) {
                  if (status == null) return false;
                  return status < 500;
                },
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
