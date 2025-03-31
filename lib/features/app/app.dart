import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/features/auth/bloc/auth_bloc.dart';
import 'package:home_management/generated/l10n.dart';
import 'package:responsive_builder/responsive_builder.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => getIt<AuthBloc>()
        ..add(LoginInitDevice())
        ..add(CheckSessionToken()),
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppState();
}

class _AppState extends State<AppView> {
  final AppRouter _appRouter = getIt();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
            listenWhen: (prev, curr) => prev.screen != curr.screen,
            listener: (context, state) {
              switch (state.screen) {
                case AuthScreen.logIn:
                  _appRouter.pushAndPopUntil<void>(const LoginRoute(), predicate: (
                    Route<dynamic> route,
                  ) {
                    return false;
                  });
                  break;
                case AuthScreen.home:
                  _appRouter.replaceAll([const HomeRoute()]);
                  break;

                case AuthScreen.sms:
                  _appRouter.push(
                    VerificationRoute(model: state.model),
                  );
              }
            }),
      ],
      child: ResponsiveApp(
        builder: (context) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          ///"supportedLocales" Don't work in languages other than english
          supportedLocales: S.delegate.supportedLocales,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white,
              brightness: Brightness.light,
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
