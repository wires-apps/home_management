import 'package:dio/dio.dart';
import 'package:home_management/features/auth/repository/auth_local_repository.dart';


class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._authLocalRepository);

  final AuthLocalRepository _authLocalRepository;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final email = options.data is FormData
    //     ? (options.data as FormData)
    //         .fields
    //         .firstWhereOrNull((entry) => entry.key == 'username')
    //         ?.value
    //     : null;

    // if (email != null) {
    //   final mainDio = getIt<MainDio>();
    //   if (email.toLowerCase().contains('stage')) {
    //     await mainDio.setStageBaseUrl();
    //     debugPrint('I contain staging here: $email');
    //   } else {
    //     await mainDio.setProdBaseUrl();
    //   }
    //   options.baseUrl = mainDio.getCurrentBaseUrl();
    // }

    // debugPrint('AuthInterceptor onRequest -> path: ${options.path}}'
    //     '\n data: ${options.data}'
    //     '\n baseUrl: ${options.baseUrl}'
    //     '\n headers: ${options.headers}'
    //     '\n email: $email'
    //     '');
    // if (options.path != authSignInEndpoint) {
    //   options.headers[HttpHeaders.cookieHeader] =
    //       await _authLocalRepository.getSessionToken();
    // }
    super.onRequest(options, handler);
  }
}
