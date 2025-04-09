import 'package:home_management/core/network/error_handling/failures.dart';

class SnackBarInfo {
  const SnackBarInfo({
    this.title,
    this.message,
  });

  final String? title;
  final String? message;

  static SnackBarInfo getErrorMessage(Failure failure) {
    return switch (failure) {
      DefaultFailure() => SnackBarInfo(message: "Произошла неизвестная ошибка"),
      NoInternetConnectionFailure() => SnackBarInfo(message: "Нет соединения с интернетом"),
      ServerFailure(message: var msg) => SnackBarInfo(message: msg ?? "Ошибка сервера"),
      // NoSuchElementFailure() => SnackBarInfo("Элемент не найден"),
      // WrongPinCodeFailure() => SnackBarInfo("Неправильный PIN-код"),
      // NotLoggedInFailure() => SnackBarInfo("Пользователь не авторизован"),
      // WrongEmailOrPasswordFailure() => SnackBarInfo("Неправильный email или пароль"),
      // InfoFailure(message: var msg) => SnackBarInfo(msg),
    };
  }
}
