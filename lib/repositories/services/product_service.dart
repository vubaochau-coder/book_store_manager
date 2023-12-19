import 'package:book_store_manager/constant/data_collections.dart';
import 'package:book_store_manager/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  Future<List<ProductModel>> getAllProduct() async {
    List<ProductModel> res = [];

    final query =
        await FirebaseFirestore.instance.collection(DataCollection.book).get();
    for (var ele in query.docs) {
      res.add(ProductModel.fromJson(ele.id, ele.data()));
    }

    return res;
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
    final ref = FirebaseFirestore.instance
        .collection(DataCollection.book)
        .doc(productId);

    await ref.set({
      'title': title,
      'author': author,
      'publisher': publisher,
      'publishingYear': publishingYear,
      'type': type,
      'description': description,
    }, SetOptions(merge: true));
  }

  Future<ProductModel> getProduct(String productId) async {
    final query = await FirebaseFirestore.instance
        .collection(DataCollection.book)
        .doc(productId)
        .get();

    return ProductModel.fromJson(query.id, query.data()!);
  }
}
