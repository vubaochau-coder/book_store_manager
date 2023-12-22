import 'package:book_store_manager/repositories/import_repository.dart';
import 'package:book_store_manager/repositories/user_repository.dart';

import 'order_repository.dart';
import 'product_repository.dart';

class AppRepository {
  late ProductRepository productRepository;
  late OrderRepository orderRepository;
  late UserRepository userRepository;
  late ImportRepository importRepository;

  AppRepository() {
    productRepository = ProductRepository();
    orderRepository = OrderRepository();
    userRepository = UserRepository();
    importRepository = ImportRepository();
  }
}
