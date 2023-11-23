import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SortDropdownButton extends StatelessWidget {
  const SortDropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        dropdownStyleData: DropdownStyleData(
          offset: const Offset(0, -5),
          elevation: 0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black.withOpacity(0.8),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(height: 32),
        customButton: Container(
          height: 32,
          padding: const EdgeInsets.only(left: 12, right: 6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white.withOpacity(0.5),
            border: Border.all(color: Colors.grey, width: 0),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Mới nhất",
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                ),
                maxLines: 1,
              ),
              Gap(8),
              Icon(Icons.keyboard_arrow_down_rounded, size: 16),
            ],
          ),
        ),
        onChanged: (value) {},
        items: const [
          DropdownMenuItem(
            value: 1,
            alignment: Alignment.center,
            child: Text(
              'Mới nhất',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          DropdownMenuItem(
            value: 1,
            alignment: Alignment.center,
            child: Text(
              'Cũ nhất',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
