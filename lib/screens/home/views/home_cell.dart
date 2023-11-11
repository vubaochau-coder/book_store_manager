import 'package:book_store_manager/themes/texts.dart';
import 'package:flutter/material.dart';

class HomeCell extends StatelessWidget {
  const HomeCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      elevation: 2,
      child: SizedBox(
        height: 100,
        child: Center(
          child: Text('Sản phẩm', style: AppTexts.homeCell),
        ),
      ),
    );
  }
}
