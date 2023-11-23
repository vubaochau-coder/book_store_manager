import 'package:flutter/material.dart';

import 'order_item.dart';

class OrdersList extends StatelessWidget {
  final int itemCount;
  const OrdersList({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      itemCount: itemCount,
      padding: const EdgeInsets.symmetric(vertical: 0),
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[200],
          thickness: 4,
          height: 4,
        );
      },
      itemBuilder: (context, index) {
        return const OrderItem();
      },
    );
  }
}
