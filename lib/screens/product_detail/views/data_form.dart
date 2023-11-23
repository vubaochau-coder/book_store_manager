import 'package:flutter/material.dart';

class DataForm extends StatelessWidget {
  final Widget child;
  const DataForm({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: const BoxDecoration(color: Colors.white),
      child: child,
    );
  }
}
