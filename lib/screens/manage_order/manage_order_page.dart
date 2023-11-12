import 'package:book_store_manager/constant/app_icons.dart';
import 'package:book_store_manager/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ManageOrderPage extends StatelessWidget {
  const ManageOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Quản lý đơn hàng',
        imgBg: AppIcons.orderFill,
        color: Colors.purpleAccent[700]!,
      ),
    );
  }
}
