// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Войдите в свой аккаунт`
  String get login_screen_login_in_acc {
    return Intl.message(
      'Войдите в свой аккаунт',
      name: 'login_screen_login_in_acc',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get login_screen_login_in_title {
    return Intl.message(
      'Войти',
      name: 'login_screen_login_in_title',
      desc: '',
      args: [],
    );
  }

  /// `Забыли пароль?`
  String get login_screen_forget_password {
    return Intl.message(
      'Забыли пароль?',
      name: 'login_screen_forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get login_screen_password {
    return Intl.message(
      'Пароль',
      name: 'login_screen_password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_screen_email {
    return Intl.message(
      'Email',
      name: 'login_screen_email',
      desc: '',
      args: [],
    );
  }

  /// `Пароль слишком короткий`
  String get error_password_too_short {
    return Intl.message(
      'Пароль слишком короткий',
      name: 'error_password_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Обязательное поле*`
  String get error_required_field {
    return Intl.message(
      'Обязательное поле*',
      name: 'error_required_field',
      desc: '',
      args: [],
    );
  }

  /// `Неверный e-mail`
  String get error_input_email {
    return Intl.message(
      'Неверный e-mail',
      name: 'error_input_email',
      desc: '',
      args: [],
    );
  }

  /// `Оплата комунальных услуг`
  String get home_screen_payment_communal_service {
    return Intl.message(
      'Оплата комунальных услуг',
      name: 'home_screen_payment_communal_service',
      desc: '',
      args: [],
    );
  }

  /// `Жалобы/Предложения`
  String get home_screen_complaints_suggestions {
    return Intl.message(
      'Жалобы/Предложения',
      name: 'home_screen_complaints_suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Вызвать мастера`
  String get home_screen_call_master {
    return Intl.message(
      'Вызвать мастера',
      name: 'home_screen_call_master',
      desc: '',
      args: [],
    );
  }

  /// `База знаний`
  String get home_screen_knowledge_base {
    return Intl.message(
      'База знаний',
      name: 'home_screen_knowledge_base',
      desc: '',
      args: [],
    );
  }

  /// `Меню`
  String get home_screen_menu {
    return Intl.message(
      'Меню',
      name: 'home_screen_menu',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
