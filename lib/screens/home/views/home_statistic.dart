import 'package:book_store_manager/constant/app_icons.dart';

import 'statistic_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeStatistic extends StatelessWidget {
  const HomeStatistic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Row(
              children: [
                StatisticItem(
                  title: 'Đơn',
                  content: '302',
                  imgPath: AppIcons.order,
                ),
                const Gap(4),
                StatisticItem(
                  title: 'Đơn xong',
                  content: '98%',
                  color: Colors.blue,
                  imgPath: AppIcons.complete,
                ),
              ],
            ),
          ),
          const Gap(4),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                StatisticItem(
                  title: 'Doanh thu',
                  content: '100.8tr',
                  color: Colors.amber,
                  imgPath: AppIcons.coin,
                  isFullWidth: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
