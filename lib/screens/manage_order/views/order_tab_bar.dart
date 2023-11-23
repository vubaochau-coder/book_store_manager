import 'package:flutter/material.dart';

import '../../../constant/app_fonts.dart';
import '../../../themes/colors.dart';

class OrderTabBar extends StatelessWidget {
  final TabController tabController;
  const OrderTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: TabBar(
        controller: tabController,
        isScrollable: false,
        labelColor: AppColors.themeColor,
        splashBorderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.averta,
          fontSize: 14,
        ),
        unselectedLabelColor: Colors.grey,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: AppFonts.averta,
        ),
        labelPadding: EdgeInsets.zero,
        indicatorWeight: 0,
        indicator: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        tabs: [
          customTab('Hỏa tốc'),
          customTab('Nhanh'),
          customTab('Cơ bản'),
        ],
      ),
    );
  }

  Widget customTab(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
