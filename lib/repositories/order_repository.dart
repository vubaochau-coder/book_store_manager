import 'package:cloud_firestore/cloud_firestore.dart';

import 'services/order_service.dart';
import 'services/transaction_service.dart';

import '../models/home_statistic_model.dart';

class OrderRepository {
  late OrderService _orderService;
  late TransactionService _transactionService;

  OrderRepository() {
    _orderService = OrderService();
    _transactionService = TransactionService();
  }

  Future<HomeStatisticModel> getMonthStatistic(DateTime dateTime) async {
    return _transactionService.getMonthStatistic(dateTime);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> ordersStream(int status) {
    return _orderService.ordersStream(status);
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> orderStream(String orderId) {
    return _orderService.orderStream(orderId);
  }

  Future<Map<String, dynamic>> getProductInOrder(String productId) async {
    return _orderService.getProductInOrder(productId);
  }

  Future<void> confirmOrder(String orderId) async {
    return _orderService.confirmOrder(orderId);
  }

  Future<void> preparingConfirmOrder(String orderId) async {
    return _orderService.preparingConfirmOrder(orderId);
  }

  Future<void> preparedConfirmOrder(String orderId) async {
    return _orderService.preparedConfirmOrder(orderId);
  }
}
