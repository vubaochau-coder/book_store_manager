import 'package:book_store_manager/models/product_model.dart';
import '../../product_detail/product_detail_page.dart';
import 'package:book_store_manager/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatelessWidget {
  final int index;
  final ProductModel productModel;

  const ProductItem({
    super.key,
    required this.index,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ProductDetailPage(product: productModel);
          },
        ));
      },
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  NumberUtils.sttFormat(index),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  SizedBox(
                    height: 42,
                    width: 42,
                    child: CachedNetworkImage(
                      imageUrl: productModel.images[0],
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Gap(4),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productModel.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 13),
                          ),
                          const Gap(2),
                          Text(
                            'Kho: ${productModel.stock}',
                            style: TextStyle(
                              color: Colors.redAccent[400],
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(4),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
