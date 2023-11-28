import 'package:book_store_manager/screens/order_details/bloc/order_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'row_info_space.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
      builder: (context, state) {
        return OrderDetailsRowInfoSpace(
          title: 'Trạng thái đơn',
          content: state.isLoading
              ? ''
              : state.status == 0
                  ? 'Chờ xác nhận'
                  : state.status == 1
                      ? 'Đang chuẩn bị'
                      : state.status == 2
                          ? 'Chuẩn bị xong'
                          : state.status == 3
                              ? 'Đang vận chuyển'
                              : state.status == 4
                                  ? 'Đã hoàn thành'
                                  : 'Đã hủy',
        );
      },
    );
  }
}
