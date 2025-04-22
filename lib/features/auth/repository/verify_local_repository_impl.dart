import 'package:home_management/features/auth/models/sign_in_request_dto.dart';
import 'package:home_management/features/auth/repository/verify_local_repository.dart';

class VerifyLocalRepositoryImpl implements VerifyLocalRepository {
  var user = const SignInRequestDto(password: '', personalAccount: '', device: '', phoneNumber: '');

  @override
  SignInRequestDto getUser() => user;

  @override
  void saveUser(SignInRequestDto user) => this.user = user;
}
