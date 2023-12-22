import 'package:book_store_manager/constant/data_collections.dart';
import 'package:book_store_manager/extensions/datetime_ex.dart';
import 'package:book_store_manager/models/import_product_model.dart';
import 'package:book_store_manager/models/product_model.dart';
import 'package:book_store_manager/utils/converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImportService {
  Future<List<ImportProductModel>> getInportHistory(DateTime time) async {
    List<ImportProductModel> result = [];
    final query = await FirebaseFirestore.instance
        .collection(DataCollection.import)
        .where('time', isGreaterThanOrEqualTo: time.startOfMonth())
        .where('time', isLessThanOrEqualTo: time.endOfMonth())
        .get();

    for (var ele in query.docs) {
      Map<String, int> products = ele.data()['products'];
      Map<ProductLiteModel, int> map = {};

      final futureGr = await Future.wait(
        products.entries.map((e) => getProductLiteInfor(e.key)),
      );

      for (int i = 0; i < products.length; i++) {
        map.addAll({futureGr[i]: cvToInt(products[futureGr[i].productId])});
      }

      result.add(ImportProductModel(
        id: ele.id,
        time: cvToDate(ele['time']),
        products: map,
      ));
    }

    return result;
  }

  Future<ProductLiteModel> getProductLiteInfor(String productId) async {
    final query = await FirebaseFirestore.instance
        .collection(DataCollection.book)
        .doc(productId)
        .get();
    return ProductLiteModel.fromJson(query.id, query.data()!);
  }
}
