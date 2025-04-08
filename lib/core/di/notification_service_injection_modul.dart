import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/notification/service/notifications_service.dart';

Future<void> initNotificationService() async {
  final notificationsService = NotificationsService();
  await notificationsService.initNotification();

  getIt.registerSingleton<NotificationsService>(notificationsService);
}
