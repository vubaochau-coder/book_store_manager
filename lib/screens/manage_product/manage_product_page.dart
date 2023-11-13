import 'package:book_store_manager/constant/app_icons.dart';
import 'package:book_store_manager/screens/manage_product/views/total_product.dart';
import 'views/product_list.dart';
import 'views/search_field.dart';
import 'package:gap/gap.dart';
import 'package:book_store_manager/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ManageProductPage extends StatelessWidget {
  const ManageProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Quản lý sản phẩm',
        imgBg: AppIcons.inventoryFill,
        color: Colors.orangeAccent[700]!,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orangeAccent[400]!,
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(12),
          Row(
            children: [
              const Gap(10),
              const Expanded(child: ProductSeatchField()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.filterOutline,
                  color: Colors.orangeAccent[700],
                ),
              ),
            ],
          ),
          const Gap(12),
          const TotalProduct(),
          const Expanded(child: ProductList()),
        ],
      ),
    );
  }
}
