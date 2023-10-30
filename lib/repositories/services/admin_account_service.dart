import 'package:book_store_manager/constant/data_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAccountService {
  final _fireStore = FirebaseFirestore.instance;

  Future<bool> isAdminAccount(String uid) async {
    final query = await _fireStore
        .collection(DataCollection.admin)
        .where('id', isEqualTo: uid)
        .get();

    return query.size == 1;
  }
}
