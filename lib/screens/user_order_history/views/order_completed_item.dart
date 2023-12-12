import 'package:book_store_manager/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../themes/colors.dart';
import '../../../utils/currency_utils.dart';
import '../../../utils/date_time.dart';
import '../../../widgets/flag_cllip_path.dart';

class OrderCompletedItem extends StatelessWidget {
  final OrderModel order;

  const OrderCompletedItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipPath(
                clipper: FlagClipPath(),
                child: Container(
                  color: Colors.blue[300],
                  padding: const EdgeInsets.only(
                    top: 2,
                    bottom: 2,
                    left: 8,
                    right: 8 * 3,
                  ),
                  child: const Text(
                    'Hoàn thành',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                "Thời gian: ",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                DateTimeUtils.orderTime(order.dateCreated),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const Gap(8),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Khách hàng: ", style: TextStyle(fontSize: 13)),
                    Expanded(
                      child: Text(
                        order.userName,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Thời gian đặt: ",
                      style: TextStyle(fontSize: 13),
                    ),
                    Expanded(
                      child: Text(
                        DateTimeUtils.orderTime(order.dateCreated),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Sản phẩm (${order.products.length.toStringAsFixed(0)}): ",
                  style: const TextStyle(fontSize: 13),
                ),
                const Gap(4),
                SizedBox(
                  height: 48,
                  child: ListView.separated(
                    itemCount: order.products.length % 6,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 4);
                    },
                    itemBuilder: (context, index) {
                      if (index == 5 && order.products.length > 5) {
                        return Container(
                          width: 42,
                          height: 42,
                          color: Colors.grey,
                        );
                      }

                      return Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.amber,
                          // image: DecorationImage(
                          //   fit: BoxFit.contain,
                          //   image: CachedNetworkImageProvider(
                          //     order.products[index].imgUrl,
                          //   ),
                          // ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.themeColor,
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text.rich(
              maxLines: 1,
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Tổng đơn: ',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text:
                        "${CurrencyUtils.convertDoubleToCurrency(order.totalPrice)}đ",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(4),
        ],
      ),
    );
  }
}
