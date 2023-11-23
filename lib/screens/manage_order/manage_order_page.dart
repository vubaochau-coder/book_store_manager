import 'package:book_store_manager/constant/app_icons.dart';
import 'views/sort_dropdown_button.dart';
import 'package:book_store_manager/themes/colors.dart';
import 'views/orders_list.dart';
import 'views/order_tab_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'views/order_status_item.dart';
import 'package:book_store_manager/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ManageOrderPage extends StatefulWidget {
  const ManageOrderPage({super.key});

  @override
  State<ManageOrderPage> createState() => _ManageOrderPageState();
}

class _ManageOrderPageState extends State<ManageOrderPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Quản lý đơn hàng',
        imgBg: AppIcons.orderFill,
        color: Colors.purpleAccent[700]!,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(12),
            Text(
              'Theo dõi đơn hàng',
              style: TextStyle(
                fontSize: 15,
                color: Colors.lightBlueAccent[700],
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(6),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                OrderStatusItem(
                  icon: MdiIcons.cartArrowDown,
                  title: "Đang chuẩn bị",
                ),
                const Gap(4),
                OrderStatusItem(
                  icon: MdiIcons.cartCheck,
                  title: "Chuẩn bị xong",
                ),
                const Gap(4),
                OrderStatusItem(
                  icon: MdiIcons.truckFastOutline,
                  title: "Đang vận chuyển",
                ),
                const Gap(4),
                OrderStatusItem(
                  icon: MdiIcons.clipboardCheckOutline,
                  title: "Đơn đã xong",
                ),
              ],
            ),
            const Gap(12),
            SizedBox(
              height: 42,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Đơn chờ duyệt (12)',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.lightBlueAccent[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Text(
                    'Sắp xếp: ',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SortDropdownButton(),
                ],
              ),
            ),
            const Gap(6),
            OrderTabBar(tabController: tabController),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  OrdersList(itemCount: 12),
                  OrdersList(itemCount: 10),
                  OrdersList(itemCount: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
