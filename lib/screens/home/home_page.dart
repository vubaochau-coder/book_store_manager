import 'package:book_store_manager/themes/texts.dart';
import 'views/home_background.dart';
import 'views/home_statistic.dart';
import 'package:book_store_manager/themes/colors.dart';
import 'package:gap/gap.dart';
import 'views/home_cell.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'views/home_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.themeColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              smallSize: 8,
              backgroundColor: Colors.blue,
              child: Icon(MdiIcons.bell),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Badge(
              smallSize: 8,
              backgroundColor: Colors.blue,
              child: Icon(MdiIcons.facebookMessenger),
            ),
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      body: HomeBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TimeShower(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Thống kê trong tháng',
                    style: AppTexts.homeTitle,
                  ),
                ),
                const Gap(10),
                const HomeStatistic(),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Quản lý cửa hàng',
                    style: AppTexts.homeTitle,
                  ),
                ),
                const Gap(10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(child: HomeCell()),
                      Gap(10),
                      Expanded(child: HomeCell()),
                    ],
                  ),
                ),
                const Gap(10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(child: HomeCell()),
                      Gap(10),
                      Expanded(child: HomeCell()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
