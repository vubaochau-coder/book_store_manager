import 'package:flutter/material.dart';

class TotalProduct extends StatelessWidget {
  const TotalProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Text(
        '12 sản phẩm',
        style: TextStyle(
          color: Colors.orangeAccent[700],
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
