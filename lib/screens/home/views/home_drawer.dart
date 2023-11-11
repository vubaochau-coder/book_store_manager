import 'package:book_store_manager/constant/app_fonts.dart';
import 'package:book_store_manager/repositories/services/authentication_service.dart';
import 'package:flutter/material.dart';

import '../../../constant/app_images.dart';
import '../../../themes/colors.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.themeColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logoTransCrop,
                  height: 40,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),
                Text(
                  'App For Manager',
                  style: TextStyle(
                    fontFamily: AppFonts.dancingScript,
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              'Tài khoản',
              style: TextStyle(fontSize: 14),
            ),
            leading: const Icon(Icons.account_box_outlined, size: 20),
            style: ListTileStyle.drawer,
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Đổi mật khẩu',
              style: TextStyle(fontSize: 14),
            ),
            leading: const Icon(Icons.password_outlined, size: 20),
            style: ListTileStyle.drawer,
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Đăng xuất',
              style: TextStyle(fontSize: 14),
            ),
            leading: const Icon(Icons.logout, size: 20),
            style: ListTileStyle.drawer,
            onTap: () {
              AuthenticationService.signOut();
            },
          ),
        ],
      ),
    );
  }
}
