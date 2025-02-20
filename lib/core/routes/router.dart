import 'package:auto_route/auto_route.dart';
import 'package:home_management/features/auth/presentation/login_page.dart';
import 'package:home_management/features/home/presentation%20/home_screen.dart';
import 'package:home_management/features/notification/presentation/mobile_notification_page.dart';
import 'package:home_management/features/public_utilities/presentation/utility_bills_page.dart';

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
        ),
        AutoRoute(
          path: '/notification',
          page: NotificationRoute.page,
        ),
        AutoRoute(
          path: '/utility_bills',
          page: UtilityBillsRoute.page,
        ),
      ];
}
