import 'package:book_store_manager/constant/app_icons.dart';
import 'package:book_store_manager/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ManageUserPage extends StatelessWidget {
  const ManageUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Quản lý khách hàng',
        imgBg: AppIcons.userGroupFill,
        color: Colors.blueAccent[700]!,
      ),
    );
  }
}
