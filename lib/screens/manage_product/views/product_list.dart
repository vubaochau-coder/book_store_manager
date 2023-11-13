import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/manage_product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_item.dart';
import 'package:flutter/material.dart';

import 'styles.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text("STT", style: tableHead),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Center(
                    child: Text('Sản phẩm', style: tableHead),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ManageProductBloc, ManageProductState>(
              buildWhen: (previous, current) {
                return previous.showedProducts != current.showedProducts ||
                    previous.isLoading != current.isLoading;
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.orangeAccent[700]!,
                      size: 40,
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: state.showedProducts.length,
                  padding: const EdgeInsets.only(bottom: 72),
                  physics: const ClampingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey[200],
                      height: 1,
                      thickness: 1,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ProductItem(
                      index: index + 1,
                      productModel: state.showedProducts[index],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
