import 'package:book_store_manager/constant/app_icons.dart';
import 'package:book_store_manager/repositories/repository.dart';
import 'package:book_store_manager/themes/colors.dart';
import 'views/total_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/manage_product_bloc.dart';
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
    return BlocProvider(
      create: (context) => ManageProductBloc(
        RepositoryProvider.of<AppRepository>(context).productRepository,
      )..add(ManageProductLoading()),
      child: Scaffold(
        backgroundColor: AppColors.background,
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
                const Gap(6),
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
      ),
    );
  }
}
