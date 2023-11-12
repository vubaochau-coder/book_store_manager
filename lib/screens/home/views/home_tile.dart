import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeTile extends StatelessWidget {
  final String img;
  final String title;
  final Color color;

  const HomeTile({
    super.key,
    required this.img,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              img,
              color: color.withOpacity(0.8),
              width: 24,
              height: 24,
            ),
            const Gap(8),
            Text(
              title,
              style: TextStyle(
                color: color.withOpacity(0.8),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
