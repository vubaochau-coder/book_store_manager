import 'package:book_store_manager/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatelessWidget {
  final int index;
  const ProductItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
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
                    imageUrl:
                        "https://firebasestorage.googleapis.com/v0/b/da1-bookstore.appspot.com/o/Book%2Fbook_dx001%2F6.jpg?alt=media&token=88002ca4-ec45-4fd4-a331-eaff20e429dc",
                    fit: BoxFit.contain,
                  ),
                ),
                const Gap(4),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tuổi Trẻ Đáng Giá Bao Nhiêu (Tái Bản 2021)',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        'Kho: 82',
                        style: TextStyle(
                          color: Colors.redAccent[400],
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
