import 'package:book_store_manager/constant/data_collections.dart';
import 'package:book_store_manager/extensions/datetime_ex.dart';
import 'package:book_store_manager/utils/converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/order_model.dart';
import '../../models/order_product_model.dart';

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

  Stream<QuerySnapshot<Map<String, dynamic>>> userOrderStream(
      String userId, List<int> status) {
    return FirebaseFirestore.instance
        .collection(DataCollection.orders)
        .where('userId', isEqualTo: userId)
        .where('status', whereIn: status)
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

  Future<void> cancelOrder(String orderId) async {
    final docRef = FirebaseFirestore.instance
        .collection(DataCollection.orders)
        .doc(orderId);

    await docRef.set(
      {'status': -1},
      SetOptions(merge: true),
    );
  }

  Future<List<OrderProductModel>> getAllProductInOrder(
      List<Map<String, dynamic>> productRaw) async {
    List<OrderProductModel> res = [];

    final productsInfo = await Future.wait(
      productRaw.map(
        (e) => getProductInOrder(e['productID']),
      ),
    );

    for (int i = 0; i < productRaw.length; i++) {
      OrderProductModel temp = OrderProductModel.fromJson(
        productRaw[i],
        productsInfo[i]['productName'],
        productsInfo[i]['imgURL'],
      );
      res.add(temp);
    }

    return res;
  }

  Future<List<OrderModel>> getUserDoneOrders(String userId) async {
    List<OrderModel> res = [];

    final query = await FirebaseFirestore.instance
        .collection(DataCollection.orders)
        .where('userId', isEqualTo: userId)
        .where('status', whereIn: [-1, 4]).get();

    final test = await Future.wait(
      query.docs.map(
        (e) => getAllProductInOrder(
          List.from(e.data()['products']),
        ),
      ),
    );

    for (int i = 0; i < query.docs.length; i++) {
      res.add(
        OrderModel.fromJson(
          query.docs[i].id,
          query.docs[i].data(),
          test[i],
        ),
      );
    }

    return res;
  }

  Future<List<OrderModel>> getDoneOrdersOfMonth(DateTime month) async {
    List<OrderModel> res = [];

    final query = await FirebaseFirestore.instance
        .collection(DataCollection.orders)
        .where('status', whereIn: [-2, -1, 4])
        .where('dateCreated', isGreaterThanOrEqualTo: month.startOfMonth())
        .where('dateCreated', isLessThanOrEqualTo: month.endOfMonth())
        .get();

    final test = await Future.wait(
      query.docs.map(
        (e) => getAllProductInOrder(
          List.from(e.data()['products']),
        ),
      ),
    );

    for (int i = 0; i < query.docs.length; i++) {
      res.add(
        OrderModel.fromJson(
          query.docs[i].id,
          query.docs[i].data(),
          test[i],
        ),
      );
    }

    return res;
  }
}
