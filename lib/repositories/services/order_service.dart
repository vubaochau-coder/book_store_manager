import 'package:book_store_manager/constant/data_collections.dart';
import 'package:book_store_manager/utils/converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  Stream<QuerySnapshot<Map<String, dynamic>>> ordersStream(int status) {
    return FirebaseFirestore.instance
        .collection(DataCollection.orders)
        .where('status', isEqualTo: status)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> orderStream(String orderId) {
    return FirebaseFirestore.instance
        .collection(DataCollection.orders)
        .doc(orderId)
        .snapshots();
  }

  Future<Map<String, dynamic>> getProductInOrder(String productId) async {
    final query = await FirebaseFirestore.instance
        .collection(DataCollection.book)
        .doc(productId)
        .get();
    String productName = cvToString(query.data()?['title']);
    String imgURL = cvToString(query.data()?['mainURL']);
    return {
      'productId': productId,
      'productName': productName,
      'imgURL': imgURL,
    };
  }

  Future<void> confirmOrder(String orderId) async {
    final docRef = FirebaseFirestore.instance
        .collection(DataCollection.orders)
        .doc(orderId);

    await docRef.set(
      {'status': 1},
      SetOptions(merge: true),
    );
  }

  Future<void> preparingConfirmOrder(String orderId) async {
    final docRef = FirebaseFirestore.instance
        .collection(DataCollection.orders)
        .doc(orderId);

    await docRef.set(
      {'status': 2},
      SetOptions(merge: true),
    );
  }

  Future<void> preparedConfirmOrder(String orderId) async {
    final docRef = FirebaseFirestore.instance
        .collection(DataCollection.orders)
        .doc(orderId);

    await docRef.set(
      {'status': 3},
      SetOptions(merge: true),
    );
  }
}
