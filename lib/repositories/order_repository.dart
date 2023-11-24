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
}