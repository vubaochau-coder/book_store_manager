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
}
