import 'package:book_store_manager/constant/data_collections.dart';
import 'package:book_store_manager/models/home_statistic_model.dart';
import 'package:book_store_manager/utils/date_time.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  Future<HomeStatisticModel> getMonthStatistic(DateTime date) async {
    String docId = DateTimeUtils.monthCollection(date);

    final query = await FirebaseFirestore.instance
        .collection(DataCollection.transaction)
        .doc(docId)
        .get();
    if (query.exists) {
      return HomeStatisticModel.fromJson(query.id, query.data()!);
    } else {
      return HomeStatisticModel(
        id: docId,
        totalOrder: 0,
        completeOrder: 0,
        revenue: 0,
      );
    }
  }
}
