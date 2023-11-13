import 'package:book_store_manager/themes/colors.dart';
import 'package:flutter/material.dart';

class ProductSeatchField extends StatefulWidget {
  const ProductSeatchField({super.key});

  @override
  State<ProductSeatchField> createState() => _ProductSeatchFieldState();
}

class _ProductSeatchFieldState extends State<ProductSeatchField> {
  late TextEditingController _controller;
  bool showClearButton = false;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.themeColor,
      controller: _controller,
      style: TextStyle(
        fontSize: 14,
        color: AppColors.themeColor,
        fontWeight: FontWeight.w600,
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          if (!showClearButton) {
            setState(() {
              showClearButton = true;
            });
          }
        } else {
          setState(() {
            showClearButton = false;
          });
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        hintText: "Tìm kiếm sản phẩm...",
        hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey[100],
        filled: true,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: showClearButton
            ? IconButton(
                onPressed: () {
                  _controller.text = "";
                  setState(() {
                    showClearButton = false;
                  });
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.orangeAccent[700],
                ),
              )
            : null,
      ),
    );
  }
}
