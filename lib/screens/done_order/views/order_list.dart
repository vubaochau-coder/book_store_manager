import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[200],
          thickness: 4,
          height: 4,
        );
      },
      itemBuilder: (context, index) {
        return Container(
          height: 60,
          width: double.infinity,
          color: Colors.amber,
        );
      },
    );
  }
}
