import 'package:book_store_manager/themes/colors.dart';
import 'package:book_store_manager/themes/texts.dart';
import 'views/home_background.dart';
import 'views/home_statistic.dart';
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              smallSize: 8,
              backgroundColor: AppColors.themeColor,
              child: Icon(MdiIcons.bell, color: Colors.black),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Badge(
              smallSize: 8,
              backgroundColor: AppColors.themeColor,
              child: Icon(MdiIcons.facebookMessenger, color: Colors.black),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Tháng này', style: AppTexts.homeTitle),
                ),
                const Gap(10),
                const HomeStatistic(),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Quản lý', style: AppTexts.homeTitle),
                ),
                const Gap(10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: HomeCell(
                          content: 'Sản phẩm',
                          color1: Color(0xff6190E8),
                          color2: Color(0xffA7BFE8),
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: HomeCell(
                          content: 'Đơn hàng',
                          color1: Color(0xffFFAFBD),
                          color2: Color(0xffffc3a0),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: HomeCell(
                          content: 'Sản phẩm',
                          color1: Color(0xffa1ffce),
                          color2: Color(0xfffaffd1),
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: HomeCell(
                          content: 'Sản phẩm',
                          color1: Color(0xff6190E8),
                          color2: Color(0xffA7BFE8),
                        ),
                      ),
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
