import 'package:book_store_manager/constant/app_icons.dart';
import 'package:book_store_manager/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ManageFeedbackPage extends StatelessWidget {
  const ManageFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Quản lý đánh giá',
        imgBg: AppIcons.feedbackFill,
        color: Colors.greenAccent[700]!,
      ),
    );
  }
}
