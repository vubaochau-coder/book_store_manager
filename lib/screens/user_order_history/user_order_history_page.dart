import 'package:book_store_manager/models/user_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gap/gap.dart';
import 'views/statistic_item.dart';
import 'package:book_store_manager/themes/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class UserOrderHistoryPage extends StatelessWidget {
  final UserModel user;

  const UserOrderHistoryPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Lịch sử mua hàng',
        color: Colors.orangeAccent[700]!,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 72,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(user.avatar),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${user.name} ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              user.isMale ? "(nam)" : "(nữ)",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.phone,
                              color: Colors.grey,
                              size: 14,
                            ),
                            Text(
                              " ${user.phoneNumber}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Row(
                          children: [
                            StatisticItem(
                              value: 0,
                              title: 'Tổng đơn',
                            ),
                            StatisticItem(
                              value: 0,
                              title: 'Hoàn thành',
                              valueColor: Colors.blue,
                            ),
                            StatisticItem(
                              value: 0,
                              title: 'Đơn hủy',
                              valueColor: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(12),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                const Text(
                  'Thống kê lịch sử mua hàng',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                LineChart(
                  LineChartData(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
