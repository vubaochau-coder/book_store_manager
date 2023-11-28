import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderDetailsProductItem extends StatelessWidget {
  const OrderDetailsProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 60,
          color: Colors.amber,
        ),
        const Gap(8),
        const Expanded(
          child: SizedBox(
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kỹ Thuật Sửa Chữa Ô Tô Cơ Bản (Tái Bản 2019)',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '34.000đ',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.2,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'x1',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.2,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
