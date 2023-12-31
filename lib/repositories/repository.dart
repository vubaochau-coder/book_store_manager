import 'package:book_store_manager/repositories/import_repository.dart';
import 'package:book_store_manager/repositories/notification_repository.dart';
import 'package:book_store_manager/repositories/user_repository.dart';

import 'order_repository.dart';
import 'product_repository.dart';

class AppRepository {
  late ProductRepository productRepository;
  late OrderRepository orderRepository;
  late UserRepository userRepository;
  late ImportRepository importRepository;
  late NotificationRepository notiRepository;

  AppRepository() {
    productRepository = ProductRepository();
    orderRepository = OrderRepository();
    userRepository = UserRepository();
    importRepository = ImportRepository();
    notiRepository = NotificationRepository();
  }
}
