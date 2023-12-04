import 'styles.dart';
import 'package:flutter/material.dart';

class RowData extends StatelessWidget {
  final String title;
  final String content;
  const RowData({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "$title: ", style: PRDStyle.rowTitle),
            TextSpan(text: content, style: PRDStyle.rowContent),
          ],
        ),
      ),
    );
  }
}
