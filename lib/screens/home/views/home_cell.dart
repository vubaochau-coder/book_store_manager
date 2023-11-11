import 'package:book_store_manager/themes/texts.dart';
import 'package:flutter/material.dart';

class HomeCell extends StatelessWidget {
  final String content;
  final Color color1;
  final Color color2;

  const HomeCell({
    super.key,
    required this.content,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      elevation: 2,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [color1, color2],
          ),
        ),
        child: Center(
          child: Text(content, style: AppTexts.homeCell),
        ),
      ),
    );
  }
}
