import 'order_repository.dart';
import 'product_repository.dart';

class AppRepository {
  late ProductRepository productRepository;
  late OrderRepository orderRepository;

  AppRepository() {
    productRepository = ProductRepository();
    orderRepository = OrderRepository();
  }
}
