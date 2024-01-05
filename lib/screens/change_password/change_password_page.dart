import 'views/styles.dart';
import 'package:book_store_manager/themes/colors.dart';
import 'package:book_store_manager/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late bool show1, show2, show3;

  @override
  void initState() {
    show1 = show2 = show3 = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Đổi mật khẩu',
        color: Colors.orangeAccent[700]!,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 8 + MediaQuery.of(context).padding.bottom,
        ),
        child: SizedBox(
          height: 44,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.themeColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Cập nhật mật khẩu',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nhập mật khẩu cũ', style: Styles.title),
              const Gap(8),
              TextField(
                style: const TextStyle(fontSize: 14),
                obscureText: show1,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Colors.orangeAccent[700],
                maxLength: 16,
                decoration: InputDecoration(
                  hintText: 'Enter current password',
                  counterText: '',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey[400]),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  enabledBorder: Styles.enable,
                  focusedBorder: Styles.focused,
                  errorBorder: Styles.enableError,
                  focusedErrorBorder: Styles.focusedError,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        show1 = !show1;
                      });
                    },
                    icon: Icon(show1 ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
              ),
              const Gap(16),
              Text('Nhập mật khẩu mới', style: Styles.title),
              const Text(
                'Mật khẩu phải có độ dài từ 6 - 16 ký tự',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
              const Gap(8),
              TextField(
                style: const TextStyle(fontSize: 14),
                obscureText: show2,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Colors.orangeAccent[700],
                maxLength: 16,
                decoration: InputDecoration(
                  hintText: 'Enter new password',
                  counterText: '',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey[400]),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  enabledBorder: Styles.enable,
                  focusedBorder: Styles.focused,
                  errorBorder: Styles.enableError,
                  focusedErrorBorder: Styles.focusedError,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        show2 = !show2;
                      });
                    },
                    icon: Icon(show2 ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
              ),
              const Gap(16),
              Text('Xác nhận mật khẩu mới', style: Styles.title),
              const Gap(8),
              TextField(
                style: const TextStyle(fontSize: 14),
                obscureText: show3,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Colors.orangeAccent[700],
                maxLength: 16,
                decoration: InputDecoration(
                  hintText: 'Confirm new password',
                  counterText: '',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey[400]),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  enabledBorder: Styles.enable,
                  focusedBorder: Styles.focused,
                  errorBorder: Styles.enableError,
                  focusedErrorBorder: Styles.focusedError,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        show3 = !show3;
                      });
                    },
                    icon: Icon(show3 ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
              ),
              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}
