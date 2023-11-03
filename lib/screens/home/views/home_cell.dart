import 'package:flutter/material.dart';

class HomeCell extends StatelessWidget {
  const HomeCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.amber,
      ),
    );
  }
}
