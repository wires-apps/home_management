// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "error_input_email":
            MessageLookupByLibrary.simpleMessage("Неверный e-mail"),
        "error_password_too_short":
            MessageLookupByLibrary.simpleMessage("Пароль слишком короткий"),
        "error_required_field":
            MessageLookupByLibrary.simpleMessage("Обязательное поле*"),
        "login_screen_email": MessageLookupByLibrary.simpleMessage("Email"),
        "login_screen_forget_password":
            MessageLookupByLibrary.simpleMessage("Забыли пароль?"),
        "login_screen_login_in_acc":
            MessageLookupByLibrary.simpleMessage("Войдите в свой аккаунт"),
        "login_screen_login_in_title":
            MessageLookupByLibrary.simpleMessage("Войти"),
        "login_screen_password": MessageLookupByLibrary.simpleMessage("Пароль")
      };
}
