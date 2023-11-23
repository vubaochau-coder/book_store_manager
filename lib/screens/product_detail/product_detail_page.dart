import 'package:book_store_manager/models/product_model.dart';
import 'package:book_store_manager/screens/product_detail/views/title.dart';
import 'views/data_form.dart';
import 'package:book_store_manager/themes/colors.dart';
import 'package:book_store_manager/utils/currency_utils.dart';
import 'package:expandable_text/expandable_text.dart';
import 'views/row_data.dart';
import 'package:gap/gap.dart';

import 'views/styles.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Thông tin sản phẩm',
        color: Colors.orangeAccent[700]!,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(6),
            const MyTitle(text: 'Thông tin chung'),
            DataForm(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: PRDStyle.rowTitle.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                                height: 1.2,
                              ),
                            ),
                            RowData(title: 'Thể loại', content: product.type),
                            RowData(title: 'Tác giả', content: product.author),
                            RowData(
                                title: 'Nhà xuất bản',
                                content: product.publisher),
                            RowData(
                                title: 'Năm xuất bản',
                                content: product.publishingYear),
                          ],
                        ),
                      ),
                      const Gap(6),
                      Container(
                        width: 80,
                        height: 100,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  ExpandableText(
                    product.description.replaceAll('\n', '\n'),
                    expandText: 'Xem thêm',
                    collapseText: 'Ẩn bớt',
                    maxLines: 4,
                    linkColor: AppColors.themeColor,
                    style: PRDStyle.rowContent.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const MyTitle(text: 'Hình ảnh'),
            DataForm(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return Container(color: Colors.amber);
                },
                itemCount: 11,
              ),
            ),
            const MyTitle(text: 'Thông tin khác'),
            DataForm(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: double.infinity),
                  RowData(
                    title: 'Giá bán',
                    content: CurrencyUtils.convertDoubletoKMB(product.price),
                  ),
                  RowData(
                    title: 'Khuyến mãi',
                    content: "${product.discount * 100}%",
                  ),
                  const RowData(title: 'Số lượt bán', content: "102"),
                ],
              ),
            ),
            const MyTitle(text: 'Đánh giá về sản phẩm'),
            Container(
              height: 44,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: AppColors.themeColor,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                child: Text(
                  'Bấm để xem đánh giá về sản phẩm',
                  style: TextStyle(
                    color: AppColors.themeColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
