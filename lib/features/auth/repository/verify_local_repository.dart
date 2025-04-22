import 'package:home_management/features/auth/models/sign_in_request_dto.dart';

abstract class VerifyLocalRepository {
  void saveUser(SignInRequestDto user);

  SignInRequestDto getUser();
}
