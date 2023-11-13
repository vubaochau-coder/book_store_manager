import 'package:book_store_manager/repositories/order_repository.dart';
import 'package:book_store_manager/repositories/product_repository.dart';

class AppRepository {
  late ProductRepository productRepository;
  late OrderRepository orderRepository;

  AppRepository() {
    productRepository = ProductRepository();
    orderRepository = OrderRepository();
  }
}
