import 'services/notification_service.dart';

class NotificationRepository {
  late NotificationService _notiService;

  NotificationRepository() {
    _notiService = NotificationService();
  }
}
