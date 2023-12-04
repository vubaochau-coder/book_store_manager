import 'package:book_store_manager/utils/converter.dart';

class HomeStatisticModel {
  final String id;
  final int totalOrder;
  final int completeOrder;
  final double revenue;

  HomeStatisticModel({
    required this.id,
    required this.totalOrder,
    required this.completeOrder,
    required this.revenue,
  });

  factory HomeStatisticModel.fromJson(String id, Map<String, dynamic> json) {
    return HomeStatisticModel(
      id: id,
      totalOrder: cvToInt(json['totalOrder']),
      completeOrder: cvToInt(json['completeOrder']),
      revenue: cvToDouble(json['revenue']),
    );
  }
}
