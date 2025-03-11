import 'package:home_management/core/network/error_handling/failures.dart';

class SnackBarInfo {
  const SnackBarInfo(
    this.message,
  );

  final String? message;

  static SnackBarInfo getErrorMessage(Failure failure) {
    return switch (failure) {
      DefaultFailure() => SnackBarInfo("Произошла неизвестная ошибка"),
      NoInternetConnectionFailure() => SnackBarInfo("Нет соединения с интернетом"),
      ServerFailure(message: var msg) => SnackBarInfo(msg ?? "Ошибка сервера"),
      // NoSuchElementFailure() => SnackBarInfo("Элемент не найден"),
      // WrongPinCodeFailure() => SnackBarInfo("Неправильный PIN-код"),
      // NotLoggedInFailure() => SnackBarInfo("Пользователь не авторизован"),
      // WrongEmailOrPasswordFailure() => SnackBarInfo("Неправильный email или пароль"),
      // InfoFailure(message: var msg) => SnackBarInfo(msg),
    };
  }
}
