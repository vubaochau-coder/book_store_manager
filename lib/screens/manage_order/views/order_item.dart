import 'package:book_store_manager/themes/colors.dart';
import 'package:book_store_manager/widgets/flag_cllip_path.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: FlagClipPath(),
            child: Container(
              color: Colors.blue[300],
              padding: const EdgeInsets.only(
                top: 2,
                bottom: 2,
                left: 8,
                right: 8 * 3,
              ),
              child: const Text(
                'Đã thanh toán',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Khách hàng: ", style: TextStyle(fontSize: 13)),
                    Expanded(
                      child: Text(
                        "Vũ Bảo Châu",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ngày đặt: ", style: TextStyle(fontSize: 13)),
                    Expanded(
                      child: Text(
                        "10:32 21/11/2023",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Vận chuyển: ", style: TextStyle(fontSize: 13)),
                    Expanded(
                      child: Text(
                        "Nhanh",
                        style: TextStyle(fontSize: 13, color: Colors.green),
                      ),
                    ),
                  ],
                ),
                const Text("Sản phẩm (8): ", style: TextStyle(fontSize: 13)),
                SizedBox(
                  height: 42,
                  child: ListView.separated(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 4);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        width: 42,
                        height: 42,
                        color: Colors.amber,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.themeColor,
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const Expanded(
                  child: Text.rich(
                    maxLines: 1,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tổng đơn: ',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "345.000đ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(4),
                SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeColor.withOpacity(0.8),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Xác nhận',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(4),
        ],
      ),
    );
  }
}
