import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/notification/service/notifications_service.dart';

Future<void> initNotificationService() async {
  getIt.registerSingleton<NotificationsService>(NotificationsService()..initNotification());
  final NotificationsService notificationsService = getIt();
  await notificationsService.initNotification();
}
