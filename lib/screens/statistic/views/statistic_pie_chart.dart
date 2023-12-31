import 'package:book_store_manager/themes/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/statistic_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'indicator.dart';

class StatisticPieChart extends StatelessWidget {
  const StatisticPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 140,
          width: 140,
          child: BlocBuilder<StatisticBloc, StatisticState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(
                  child: LoadingAnimationWidget.waveDots(
                    color: AppColors.themeColor,
                    size: 40,
                  ),
                );
              }

              int complete =
                  state.orders.where((element) => element.status == 4).length;
              return PieChart(
                mainData(
                  complete,
                  state.orders.length - complete,
                ),
              );
            },
          ),
        ),
        const Gap(38),
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Indicator(
                color: Color(0xFFFFC300),
                text: 'Đơn hoàn thành',
                isSquare: true,
                size: 14,
              ),
              Gap(8),
              Indicator(
                color: Color(0xFF2196F3),
                text: 'Đơn hủy',
                isSquare: true,
                size: 14,
              ),
            ],
          ),
        ),
      ],
    );
  }

  PieChartData mainData(int complete, int cancel) {
    return PieChartData(
      pieTouchData: PieTouchData(
        touchCallback: (FlTouchEvent event, pieTouchResponse) {},
      ),
      centerSpaceRadius: 0,
      sectionsSpace: 1,
      borderData: FlBorderData(
        show: false,
      ),
      sections: (complete + cancel == 0)
          ? [
              PieChartSectionData(
                value: 1,
                radius: 70,
                title: "0 đơn",
                color: Colors.grey,
                titleStyle: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ]
          : [
              PieChartSectionData(
                value: complete.toDouble(),
                radius: 70,
                title: "${complete.toStringAsFixed(0)} đơn",
                color: const Color(0xFFFFC300),
                titleStyle: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              PieChartSectionData(
                value: cancel.toDouble(),
                radius: 70,
                title: "${cancel.toStringAsFixed(0)} đơn",
                color: const Color(0xFF2196F3),
                titleStyle: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
    );
  }
}
