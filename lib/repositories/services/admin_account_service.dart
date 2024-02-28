import 'package:book_store_manager/constant/data_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAccountService {
  final _fireStore = FirebaseFirestore.instance;

  Future<bool> checkIsAdminUsingId(String uid) async {
    final query = await _fireStore
        .collection(DataCollection.admin)
        .where('id', isEqualTo: uid)
        .get();

    return query.size == 1;
  }

  Future<bool> checkIsAdminUsingEmail(String email) async {
    final query = await _fireStore
        .collection(DataCollection.admin)
        .where('email', isEqualTo: email)
        .get();

    return query.size == 1;
  }
}
