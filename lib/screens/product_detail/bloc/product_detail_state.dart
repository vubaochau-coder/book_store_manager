part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  final bool isLoading;
  final ProductModel? productData;

  const ProductDetailState({
    this.isLoading = true,
    this.productData,
  });

  @override
  List<Object?> get props => [isLoading, productData];

  ProductDetailState copyWith({bool? isLoading, ProductModel? productData}) {
    return ProductDetailState(
      isLoading: isLoading ?? this.isLoading,
      productData: productData ?? this.productData,
    );
  }
}
