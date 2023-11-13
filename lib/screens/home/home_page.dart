import 'package:book_store_manager/constant/app_icons.dart';
import 'package:book_store_manager/screens/home/views/home_tile.dart';
import '../manage_feedback/manage_feedback_page.dart';
import '../manage_order/manage_order_page.dart';
import '../manage_product/manage_product_page.dart';
import '../manage_user/manage_user_page.dart';
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
              child: Icon(MdiIcons.bellOutline, color: Colors.black),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Badge(
              smallSize: 8,
              backgroundColor: AppColors.themeColor,
              child: Icon(MdiIcons.chatOutline, color: Colors.black),
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
                const Gap(10),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: HomeCell(
                          content: 'Sản phẩm',
                          color: Colors.orangeAccent[700]!,
                          img: AppIcons.inventory,
                          imgBg: AppIcons.inventoryFill,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return const ManageProductPage();
                              },
                            ));
                          },
                        ),
                      ),
                      const Gap(8),
                      Expanded(
                        child: HomeCell(
                          content: 'Đơn hàng',
                          color: Colors.purpleAccent[700]!,
                          img: AppIcons.order,
                          imgBg: AppIcons.orderFill,
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return const ManageOrderPage();
                              },
                            ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: HomeCell(
                          content: 'Đánh giá',
                          color: Colors.greenAccent[700]!,
                          img: AppIcons.feedback,
                          imgBg: AppIcons.feedbackFill,
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return const ManageFeedbackPage();
                              },
                            ));
                          },
                        ),
                      ),
                      const Gap(8),
                      Expanded(
                        child: HomeCell(
                          content: 'Khách hàng',
                          color: Colors.blueAccent[700]!,
                          img: AppIcons.userGroup,
                          imgBg: AppIcons.userGroupFill,
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return const ManageUserPage();
                              },
                            ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Khác', style: AppTexts.homeTitle),
                ),
                const Gap(10),
                HomeTile(
                  title: 'Nhập hàng',
                  img: AppIcons.add,
                  color: Colors.orangeAccent[700]!,
                  onTap: () {},
                ),
                const Gap(10),
                HomeTile(
                  title: 'Thống kê',
                  img: AppIcons.chart,
                  color: Colors.blue[700]!,
                  onTap: () {},
                ),
                const Gap(8),
                HomeTile(
                  title: 'Báo cáo của khách hàng',
                  img: AppIcons.exclamation,
                  color: Colors.redAccent,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
