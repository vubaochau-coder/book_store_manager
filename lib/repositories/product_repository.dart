import 'dart:io';

import 'package:book_store_manager/models/product_model.dart';
import '../models/product_create_model.dart';
import 'services/product_service.dart';

class ProductRepository {
  late ProductService _service;

  ProductRepository() {
    _service = ProductService();
  }

  Future<List<ProductModel>> getAllProduct() async {
    return _service.getAllProduct();
  }

  Future<void> updateOverviewProduct({
    required String productId,
    required String title,
    required String author,
    required String publisher,
    required String publishingYear,
    required String type,
    required String description,
  }) async {
    return _service.updateOverviewProduct(
      productId: productId,
      title: title,
      author: author,
      publisher: publisher,
      publishingYear: publishingYear,
      type: type,
      description: description,
    );
  }

  Future<ProductModel> getProduct(String productId) async {
    return _service.getProduct(productId);
  }

  createNewProduct(ProductCreateModel product, List<File> imgs) async {
    return _service.createNewProduct(product, imgs);
  }

  updatePriceAndDiscount(
      String productId, double price, double discount) async {
    return _service.updatePriceAndDiscount(productId, price, discount);
  }
}
