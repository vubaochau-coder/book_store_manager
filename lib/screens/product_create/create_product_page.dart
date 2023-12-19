import 'package:book_store_manager/constant/app_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:gap/gap.dart';
import 'views/textfield_title.dart';
import 'package:book_store_manager/themes/colors.dart';
import 'package:book_store_manager/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Sản phẩm: Tạo sản phẩm mới',
        color: Colors.orangeAccent[700]!,
        imgBg: AppIcons.inventoryFill,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
          bottom: 8 + MediaQuery.of(context).padding.bottom,
        ),
        child: SizedBox(
          height: 44,
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
              'Tiếp tục',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextFieldTitle(title: 'Tên sách'),
              TextField(
                onChanged: (value) {},
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700]!,
                ),
                decoration: _customDecoration(hint: 'Enter Book title'),
              ),
              const TextFieldTitle(title: 'Tác giả', topSpace: 8),
              TextField(
                onChanged: (value) {},
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(fontSize: 14),
                decoration: _customDecoration(hint: 'Author'),
              ),
              const TextFieldTitle(title: 'Nhà xuất bản', topSpace: 8),
              TextField(
                onChanged: (value) {},
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(fontSize: 14),
                decoration: _customDecoration(hint: 'Publisher'),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextFieldTitle(
                          title: 'Năm xuất bản',
                          topSpace: 8,
                        ),
                        TextField(
                          onChanged: (value) {},
                          readOnly: true,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          style: const TextStyle(fontSize: 14),
                          decoration: _customDecoration(
                            hint: 'Publishing year',
                          ).copyWith(
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.grey[700]!,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextFieldTitle(
                          title: 'Thể loại',
                          topSpace: 8,
                        ),
                        TextField(
                          onChanged: (value) {},
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          style: const TextStyle(fontSize: 14),
                          decoration: _customDecoration(hint: 'Publisher'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const TextFieldTitle(title: 'Hình ảnh', topSpace: 8),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(8),
                child: const SizedBox(
                  width: 64,
                  height: 64,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, color: Colors.grey),
                      Text('Select', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
              const TextFieldTitle(title: 'Mô tả', topSpace: 8),
              TextField(
                onChanged: (value) {},
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                style: const TextStyle(fontSize: 14),
                decoration: _customDecoration(
                  hint: 'Description',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
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
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
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
