import 'statistic_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeStatistic extends StatelessWidget {
  const HomeStatistic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          StatisticItem(title: 'Số đơn', content: '302'),
          Gap(10),
          StatisticItem(
            title: 'Hoàn thành',
            content: '98%',
            color: Colors.blue,
          ),
          Gap(10),
          StatisticItem(
            title: 'Doanh thu',
            content: '100.8tr',
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
