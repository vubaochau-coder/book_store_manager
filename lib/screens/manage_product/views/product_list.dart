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
            child: ListView.separated(
              itemCount: 12,
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
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
