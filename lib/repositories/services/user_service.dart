import 'package:book_store_manager/constant/data_collections.dart';
import 'package:book_store_manager/constant/data_document.dart';
import 'package:book_store_manager/models/user_model.dart';
import 'package:book_store_manager/utils/converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  Stream<QuerySnapshot<Map<String, dynamic>>> userTransactionStream(
      String uid) {
    return FirebaseFirestore.instance
        .collection(DataCollection.user)
        .doc(uid)
        .collection(DataCollection.transaction)
        .snapshots();
  }

  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> res = [];

    final query =
        await FirebaseFirestore.instance.collection(DataCollection.user).get();
    for (var ele in query.docs) {
      res.add(UserModel.fromJson(ele.data(), ele.id));
    }

    return res;
  }

  Future<Map<String, dynamic>> getUserOrderStatistic(String userId) async {
    final query = await FirebaseFirestore.instance
        .collection(DataCollection.user)
        .doc(userId)
        .get();

    int totalOrders = cvToInt(query.data()!['totalOrders']);
    int completeOrders = cvToInt(query.data()!['completeOrders']);
    return {
      'totalOrders': totalOrders,
      'completeOrders': completeOrders,
    };
  }

  Future<int> getUserTotalOrder(String userId) async {
    final query = await FirebaseFirestore.instance
        .collection(DataCollection.user)
        .doc(userId)
        .collection(DataCollection.transaction)
        .doc(DataDocument.allOrders)
        .get();

    if (query.exists) {
      return query.data()!.length;
    } else {
      return 0;
    }
  }

  Future<int> getUserCompleteOrder(String userId) async {
    final query = await FirebaseFirestore.instance
        .collection(DataCollection.user)
        .doc(userId)
        .collection(DataCollection.transaction)
        .doc(DataDocument.completeOrders)
        .get();

    if (query.exists) {
      return query.data()!.length;
    } else {
      return 0;
    }
  }

  Future<int> getUserCancelOrder(String userId) async {
    final query = await FirebaseFirestore.instance
        .collection(DataCollection.user)
        .doc(userId)
        .collection(DataCollection.transaction)
        .doc(DataDocument.cancelOrders)
        .get();

    if (query.exists) {
      return query.data()!.length;
    } else {
      return 0;
    }
  }

  Future<UserLiteModel> getUserLiteModel(String userId) async {
    final query = await FirebaseFirestore.instance
        .collection(DataCollection.user)
        .doc(userId)
        .get();

    return UserLiteModel.fromJson(query.id, query.data()!);
  }
}
