import 'package:gap/gap.dart';

import '../../../constant/enum.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

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
        menuItemStyleData: const MenuItemStyleData(
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 4),
        ),
        customButton: Container(
          height: 32,
          // width: 92,
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
                "Đã hủy",
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
        onChanged: (value) {
          if (value != null) {
            //TODO
          }
        },
        items: const [
          DropdownMenuItem(
            value: OrderHistorySortType.all,
            alignment: Alignment.center,
            child: Text(
              'Tất cả',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          DropdownMenuItem(
            value: OrderHistorySortType.complete,
            alignment: Alignment.center,
            child: Text(
              'Hoàn thành',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          DropdownMenuItem(
            value: OrderHistorySortType.cancel,
            alignment: Alignment.center,
            child: Text(
              'Đã hủy',
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
