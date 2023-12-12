import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CalendarButton extends StatefulWidget {
  const CalendarButton({super.key});

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.only(left: 12, right: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white.withOpacity(0.5),
        border: Border.all(color: Colors.grey, width: 0),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "12/2022",
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 12,
            ),
            maxLines: 1,
          ),
          Gap(8),
          Icon(Icons.calendar_month_outlined, size: 16),
        ],
      ),
    );
  }
}
