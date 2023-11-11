import 'package:book_store_manager/screens/home/views/statistic_item2.dart';
import 'package:flutter/material.dart';

class StatisticItem extends StatelessWidget {
  final String title;
  final String content;
  final String imgPath;
  final Color? color;
  final bool isFullWidth;

  const StatisticItem({
    super.key,
    required this.title,
    required this.content,
    this.color,
    required this.imgPath,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return !isFullWidth
        ? StatisticItem2(
            title: title, content: content, imgPath: imgPath, color: color)
        : Expanded(
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
                      color ?? Colors.green,
                      color != null
                          ? color!.withOpacity(0.4)
                          : Colors.green.withOpacity(0.4),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 4,
                      bottom: 4,
                      left: 8,
                      child: Image.asset(
                        imgPath,
                        height: 46,
                        width: 46,
                        fit: BoxFit.contain,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
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
                          Center(
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
                  ],
                ),
              ),
            ),
          );
  }
}
