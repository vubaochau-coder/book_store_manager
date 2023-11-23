import 'package:book_store_manager/models/product_model.dart';
import 'services/product_service.dart';

class ProductRepository {
  late ProductService _service;

  ProductRepository() {
    _service = ProductService();
  }

  Future<List<ProductModel>> getAllProduct() async {
    return _service.getAllProduct();
  }
}
