import 'package:flutter/material.dart';
import 'package:home_management/core/network/error_handling/failures.dart';

class SnackBarInfo {
  const SnackBarInfo({
    this.title,
    this.message,
    this.color,
  });

  final String? title;
  final String? message;
  final Color? color;

  static SnackBarInfo getErrorMessage(Failure failure) {
    return switch (failure) {
      DefaultFailure() => SnackBarInfo(
          message: "Произошла неизвестная ошибка",
          color: Colors.red.shade500,
        ),
      NoInternetConnectionFailure() => SnackBarInfo(
          message: "Нет соединения с интернетом",
          color: Colors.red.shade500,
        ),
      ServerFailure(message: var msg) => SnackBarInfo(
          message: msg ?? "Ошибка сервера",
          color: Colors.red.shade500,
        ),
    };
  }
}
