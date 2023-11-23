import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeTile extends StatelessWidget {
  final String img;
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const HomeTile({
    super.key,
    required this.img,
    required this.title,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
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
                style: const TextStyle(
                  color: Colors.black87,
                  // color: color.withOpacity(0.8),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_rounded, size: 16)
            ],
          ),
        ),
      ),
    );
  }
}
