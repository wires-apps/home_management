import 'package:home_management/generated/l10n.dart';

abstract class ValidatorUtils {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return S.current.error_required_field;
    }
    final bool emailValid = RegExp(
      r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{3,}$',
    ).hasMatch(email);

    return emailValid ? null : S.current.error_input_email;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return S.current.error_required_field;
    }
    if (password.length < 8) {
      return S.current.error_password_too_short;
    }
    return null;
  }
}
