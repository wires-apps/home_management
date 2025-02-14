import 'package:auto_route/auto_route.dart';
import 'package:home_management/feature/auth/presentation/login_page.dart';
import 'package:home_management/feature/home/presentation%20/home_screen.dart';
import 'package:home_management/feature/notification/presentation/notification_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
          initial: false,
        ),
        AutoRoute(
          path: '/notification',
          page: NotificationRoute.page,
          initial: false,
        ),
      ];
}
