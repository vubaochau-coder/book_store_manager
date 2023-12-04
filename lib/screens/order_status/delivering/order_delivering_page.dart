import 'package:book_store_manager/widgets/empty_orders_list.dart';
import 'package:book_store_manager/widgets/loading_list.dart';

import 'bloc/delivering_order_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/delivering_order_item.dart';
import 'package:flutter/material.dart';

class OrderDeliveringPage extends StatelessWidget {
  const OrderDeliveringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveringOrderBloc, DeliveringOrderState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingList();
        }

        if (state.deliveringOrders.isEmpty) {
          return const EmptyOrdersList();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: ListView.separated(
            itemCount: state.deliveringOrders.length,
            padding: const EdgeInsets.symmetric(vertical: 4),
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey[200],
                thickness: 4,
                height: 4,
              );
            },
            itemBuilder: (context, index) {
              return DeliveringOrderItem(
                order: state.deliveringOrders[index],
              );
            },
          ),
        );
      },
    );
  }
}
