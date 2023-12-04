import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../themes/colors.dart';
import '../../../widgets/dialogs/confirm_dialog.dart';

class ConfirmOrderButton extends StatelessWidget {
  const ConfirmOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const ConfirmDialog(
                    cancelString: 'Thoát',
                    confirmString: 'Hủy đơn',
                    child: Column(
                      children: [
                        Text(
                          'Hủy đơn hàng',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Gap(12),
                        Text(
                          'Xác nhận hủy đơn hàng?',
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ),
                        Gap(12),
                      ],
                    ),
                  );
                },
              ).then((value) {
                if (value != null && value == true) {}
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(
                  color: AppColors.themeColor,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              'Hủy đơn',
              style: TextStyle(
                color: AppColors.themeColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const ConfirmDialog(
                    cancelString: 'Thoát',
                    confirmString: 'Xác nhận',
                    child: Column(
                      children: [
                        Text(
                          'Xác nhận đơn hàng',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Gap(12),
                        Text(
                          'Đơn hàng sẽ được chuyển sang trạng thái đang chuẩn bị',
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ),
                        Gap(12),
                      ],
                    ),
                  );
                },
              ).then((value) {
                if (value != null && value == true) {}
              });
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.themeColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text(
              'Xác nhận đơn',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
