import 'package:book_store_manager/constant/data_collections.dart';
import 'package:book_store_manager/constant/enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  final _notiRef =
      FirebaseFirestore.instance.collection(DataCollection.adminNoti);

  Stream<QuerySnapshot<Map<String, dynamic>>> notiStream(
      NotiViewType type, int limit) {
    if (type == NotiViewType.all) {
      return _notiRef
          .orderBy('date', descending: true)
          .limit(limit)
          .snapshots();
    }

    return _notiRef
        .where('isRead', isEqualTo: false)
        .orderBy('date', descending: true)
        .limit(limit)
        .snapshots();
  }

  Future<void> updateIsReadNoti(String notiId, bool isRead) async {
    final docRef = _notiRef.doc(notiId);
    await docRef.set({
      'isRead': isRead,
    }, SetOptions(merge: true));
  }

  Future<void> createConfirmOrderNoti(String userId, String orderId) async {
    await FirebaseFirestore.instance
        .collection(DataCollection.user)
        .doc(userId)
        .collection(DataCollection.userNoti)
        .add({
      'title': 'Đơn hàng của bạn đã được xác nhận',
      'content':
          'Đơn hàng $orderId của bạn đã được người bán xác nhận. Cảm ơn bạn đã mua sắm cùng IBOO!',
      'date': DateTime.now(),
      'isRead': false,
      'actionCode': 'order_1',
    });
  }

  Future<void> createPreparedOrderNoti(String userId, String orderId) async {
    await FirebaseFirestore.instance
        .collection(DataCollection.user)
        .doc(userId)
        .collection(DataCollection.userNoti)
        .add({
      'title': 'Đơn hàng của bạn đã được chuẩn bị',
      'content':
          'Đơn hàng $orderId của bạn đã được người bán chuẩn bị xong. Đơn hàng sẽ sớm được giao cho người vận chuyển!',
      'date': DateTime.now(),
      'isRead': false,
      'actionCode': 'order_1',
    });
  }

  Future<void> createDeliverOrderNoti(String userId, String orderId) async {
    await FirebaseFirestore.instance
        .collection(DataCollection.user)
        .doc(userId)
        .collection(DataCollection.userNoti)
        .add({
      'title': 'Đơn hàng của bạn đã được giao cho người bán',
      'content':
          'Đơn hàng $orderId của bạn đã được giao cho bên vận chuyển. Đơn hàng sẽ sớm được giao đến bạn!',
      'date': DateTime.now(),
      'isRead': false,
      'actionCode': 'order_2',
    });
  }

  Future<void> readAllNoti() async {
    final allNotis = await _notiRef.where('isRead', isEqualTo: false).get();

    var batch = FirebaseFirestore.instance.batch();
    for (var ele in allNotis.docs) {
      batch.update(ele.reference, {'isRead': true});
    }

    await batch.commit();
  }
}
