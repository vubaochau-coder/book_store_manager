import 'package:book_store_manager/models/order_model.dart';
import 'await_confirm_order_item.dart';

import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  final List<OrderModel> orders;
  const OrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      itemCount: orders.length,
      padding: const EdgeInsets.symmetric(vertical: 0),
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[200],
          thickness: 4,
          height: 4,
        );
      },
      itemBuilder: (context, index) {
        return AwaitConfirmOrderItem(
          order: orders[index],
        );
      },
    );
  }
}
