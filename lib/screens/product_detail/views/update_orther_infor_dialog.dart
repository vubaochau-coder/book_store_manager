import 'package:book_store_manager/utils/currency_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../themes/colors.dart';

class UpdateOrtherInforDialog extends StatefulWidget {
  final double price;
  final double discount;

  const UpdateOrtherInforDialog(
      {super.key, required this.price, required this.discount});

  @override
  State<UpdateOrtherInforDialog> createState() =>
      _UpdateOrtherInforDialogState();
}

class _UpdateOrtherInforDialogState extends State<UpdateOrtherInforDialog> {
  late TextEditingController _priceController, _discountController;

  @override
  void initState() {
    _priceController = TextEditingController();
    _discountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _priceController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 10),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Cập nhật giá sản phẩm',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(16),
              const Text(
                'Giá gốc',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Gap(4),
              TextField(
                controller: _priceController,
                style: const TextStyle(fontSize: 14),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
                decoration: _customDecoration(
                  hint: CurrencyUtils.convertDoubleToCurrency(widget.price),
                ).copyWith(
                  suffixText: 'Vnđ',
                  suffixStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const Gap(16),
              const Text(
                'Giảm giá',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Gap(4),
              TextField(
                controller: _discountController,
                style: const TextStyle(fontSize: 14),
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: _customDecoration(
                  hint: CurrencyUtils.convertDoubleToCurrency(
                    widget.discount * 100,
                  ),
                ).copyWith(
                  suffixText: '%',
                  suffixStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const Gap(32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: AppColors.themeColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'Thoát',
                        style: TextStyle(color: AppColors.themeColor),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Cập nhật',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _customDecoration({
    String? hint,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 13),
      contentPadding:
          contentPadding ?? const EdgeInsets.symmetric(horizontal: 12),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
