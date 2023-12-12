import 'package:book_store_manager/models/product_model.dart';
import 'package:book_store_manager/themes/texts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../widgets/title.dart';
import '../../widgets/data_form.dart';
import 'package:book_store_manager/themes/colors.dart';
import 'package:book_store_manager/utils/currency_utils.dart';
import 'package:expandable_text/expandable_text.dart';
import 'views/row_data.dart';
import 'package:gap/gap.dart';

import 'views/styles.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              centerTitle: true,
              elevation: 0,
              floating: true,
              snap: true,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              title: Text('Thông tin sản phẩm', style: AppTexts.appbarTitle),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orangeAccent[700]!,
                      Colors.orangeAccent[700]!.withOpacity(0.6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataForm(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyTitle(text: 'Thông tin chung'),
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
                              Divider(color: AppColors.themeColor),
                              RowData(title: 'Thể loại', content: product.type),
                              RowData(
                                  title: 'Tác giả', content: product.author),
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
                        CachedNetworkImage(
                          imageUrl: product.mainImage,
                          width: 80,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    Divider(color: AppColors.themeColor),
                    product.description.isEmpty
                        ? Text(
                            "(Không có mô tả)",
                            style: PRDStyle.rowContent.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        : ExpandableText(
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
              DataForm(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTitle(
                      text:
                          'Hình ảnh (${product.allImages.length.toStringAsFixed(0)})',
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 1,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          imageUrl: product.allImages[index],
                          fit: BoxFit.contain,
                          placeholder: (context, url) {
                            return Container(
                              color: Colors.grey[300],
                            );
                          },
                        );
                      },
                      itemCount: product.allImages.length,
                    ),
                  ],
                ),
              ),
              DataForm(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyTitle(text: 'Thông tin khác'),
                    const SizedBox(width: double.infinity),
                    RowData(
                      title: 'Giá bán',
                      content:
                          '${CurrencyUtils.convertDoubleToCurrency(product.price)}đ',
                    ),
                    RowData(
                      title: 'Khuyến mãi',
                      content:
                          "${(product.discount * 100).toStringAsFixed(0)}%",
                    ),
                    const RowData(title: 'Số lượt bán', content: "102"),
                  ],
                ),
              ),
              DataForm(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyTitle(text: 'Đánh giá về sản phẩm'),
                    const Gap(8),
                    SizedBox(
                      height: 44,
                      width: double.infinity,
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
            ],
          ),
        ),
      ),
    );
  }
}
