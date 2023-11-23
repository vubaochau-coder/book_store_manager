import 'package:flutter/material.dart';

import 'styles.dart';

class MyTitle extends StatelessWidget {
  final String text;
  const MyTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 6),
      child: Text(text, style: PRDStyle.title),
    );
  }
}
