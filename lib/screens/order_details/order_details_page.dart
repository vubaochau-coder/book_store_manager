import 'package:book_store_manager/models/order_model.dart';
import 'package:book_store_manager/repositories/repository.dart';
import 'bloc/order_details_bloc.dart';
import 'views/order_status.dart';
import 'package:book_store_manager/utils/date_time.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/product_item.dart';
import 'package:gap/gap.dart';

import 'views/row_info_space.dart';
import 'package:book_store_manager/widgets/data_form.dart';
import 'package:flutter/material.dart';

import '../../constant/app_icons.dart';
import '../../themes/colors.dart';
import '../../widgets/custom_app_bar.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderModel orderData;

  const OrderDetailsPage({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsBloc(
        RepositoryProvider.of<AppRepository>(context).orderRepository,
      )..add(InitialDetailEvent(orderId: orderData.orderId)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(
          title: 'Chi tiết đơn hàng',
          imgBg: AppIcons.orderFill,
          color: Colors.purpleAccent[700]!,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataForm(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderDetailsRowInfoSpace(
                      title: 'Mã đơn',
                      content: orderData.orderId,
                    ),
                    OrderDetailsRowInfoSpace(
                      title: 'Khách hàng',
                      content: orderData.userName,
                    ),
                    OrderDetailsRowInfoSpace(
                      title: 'Số điện thoại',
                      content: orderData.phone,
                    ),
                    OrderDetailsRowInfoSpace(
                      title: 'Thời gian đặt',
                      content: DateTimeUtils.orderTime(orderData.dateCreated),
                    ),
                    OrderDetailsRowInfoSpace(
                      title: 'Phương thức vận chuyển',
                      content: orderData.transport,
                    ),
                    const Divider(color: Colors.grey),
                    OrderDetailsRowInfoSpace(
                      title: 'Địa chỉ',
                      content: orderData.address,
                      maxLines: 5,
                      contentStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    OrderDetailsRowInfoSpace(
                      title: 'Ghi chú',
                      content: orderData.note.isNotEmpty
                          ? '"${orderData.note}"'
                          : '',
                      maxLines: 5,
                      contentStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    OrderDetailsRowInfoSpace(
                      title: 'Phương thức',
                      content: orderData.paymentMethod,
                    ),
                    OrderDetailsRowInfoSpace(
                      title: 'Trạng thái',
                      content:
                          orderData.paid ? 'Đã thanh toán' : 'Chưa thanh toán',
                    ),
                    const Divider(color: Colors.grey),
                    const OrderStatus(),
                  ],
                ),
              ),
              DataForm(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sản phẩm (4)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Gap(10),
                    ListView.separated(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const Divider(color: Colors.grey, height: 10);
                      },
                      itemBuilder: (context, index) {
                        return const OrderDetailsProductItem();
                      },
                    ),
                  ],
                ),
              ),
              const DataForm(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thành tiền',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Gap(6),
                    OrderDetailsRowInfoSpace(
                      title: 'Phí vận chuyển',
                      content: '15.000đ',
                    ),
                    OrderDetailsRowInfoSpace(
                      title: 'Sản phẩm',
                      content: '136.000đ',
                    ),
                    OrderDetailsRowInfoSpace(
                      title: 'Giảm',
                      content: '0đ',
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      children: [
                        Text(
                          "Tổng đơn: ",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '151.000đ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).padding.bottom + 10,
                  top: 4,
                ),
                child: SizedBox(
                  height: 44,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Xác nhận đơn',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
