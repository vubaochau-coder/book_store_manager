import 'package:book_store_manager/constant/app_icons.dart';
import 'package:book_store_manager/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ManageProductPage extends StatelessWidget {
  const ManageProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Quản lý sản phẩm',
        imgBg: AppIcons.inventoryFill,
        color: Colors.orangeAccent[700]!,
      ),
    );
  }
}
