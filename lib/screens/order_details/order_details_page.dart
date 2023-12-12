import 'package:book_store_manager/models/order_model.dart';
import 'package:book_store_manager/repositories/repository.dart';
import 'views/deliver_button.dart';
import 'views/prepare_button.dart';
import 'views/confirm_button.dart';
import 'package:book_store_manager/utils/currency_utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../models/order_product_model.dart';
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
          color: Colors.orangeAccent[700]!,
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
                      contentStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: orderData.paid ? Colors.green : Colors.red,
                      ),
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
                    Text(
                      'Sản phẩm (${orderData.products.length.toStringAsFixed(0)})',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Gap(10),
                    ListView.separated(
                      itemCount: orderData.products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const Divider(color: Colors.grey, height: 10);
                      },
                      itemBuilder: (context, index) {
                        return OrderDetailsProductItem(
                          product: orderData.products[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
              DataForm(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Thành tiền',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Gap(6),
                    OrderDetailsRowInfoSpace(
                      title: 'Phí vận chuyển',
                      content:
                          "${CurrencyUtils.convertDoubleToCurrency(orderData.transportPrice)}đ",
                    ),
                    OrderDetailsRowInfoSpace(
                      title: 'Sản phẩm',
                      content:
                          "${CurrencyUtils.convertDoubleToCurrency(productPrice(orderData.products))}đ",
                    ),
                    OrderDetailsRowInfoSpace(
                      title: 'Giảm',
                      content:
                          "${CurrencyUtils.convertDoubleToCurrency(productPrice(orderData.products) - orderData.productPrice)}đ",
                    ),
                    const Divider(color: Colors.grey),
                    Row(
                      children: [
                        const Text(
                          "Tổng đơn: ",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${CurrencyUtils.convertDoubleToCurrency(orderData.totalPrice)}đ",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
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
                  left: 6,
                  right: 6,
                  bottom: MediaQuery.of(context).padding.bottom + 10,
                  top: 4,
                ),
                child: SizedBox(
                  height: 44,
                  width: double.infinity,
                  child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Center(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        );
                      }

                      if (state.status == -1) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: const Text(
                            'Đơn hàng đã bị hủy',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      if (state.status == 0) {
                        return ConfirmOrderButton(order: orderData);
                      }

                      if (state.status == 1) {
                        return PrepareOrderButton(orderId: orderData.orderId);
                      }

                      if (state.status == 2) {
                        return DeliverButton(orderId: orderData.orderId);
                      }

                      if (state.status == 3) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: const Text(
                            'Đơn hàng đang được vận chuyển',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      if (state.status == 4) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Đơn hàng đã được giao thành công',
                                style: TextStyle(color: Colors.white),
                              ),
                              Gap(4),
                              Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            ],
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double productPrice(List<OrderProductModel> products) {
    double total = 0;
    for (var ele in products) {
      total += ele.count * ele.priceBPDiscount;
    }
    return total;
  }
}
