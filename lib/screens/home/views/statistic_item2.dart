import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StatisticItem2 extends StatelessWidget {
  final String title;
  final String content;
  final String imgPath;
  final Color? color;

  const StatisticItem2({
    super.key,
    required this.title,
    required this.content,
    this.color,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                color ?? Colors.tealAccent[700]!,
                color != null
                    ? color!.withOpacity(0.4)
                    : Colors.tealAccent[400]!.withOpacity(0.4),
              ],
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8),
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.contain,
                  height: 46,
                  width: 46,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const Gap(8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            content,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
