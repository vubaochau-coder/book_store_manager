import 'package:book_store_manager/constant/data_collections.dart';
import 'package:book_store_manager/models/user_model.dart';
import 'package:book_store_manager/utils/converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  Stream<DocumentSnapshot<Map<String, dynamic>>> userProfileStream(String uid) {
    return FirebaseFirestore.instance
        .collection(DataCollection.user)
        .doc(uid)
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
}
