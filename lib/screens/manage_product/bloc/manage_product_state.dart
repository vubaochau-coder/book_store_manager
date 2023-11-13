part of 'manage_product_bloc.dart';

class ManageProductState extends Equatable {
  final bool isLoading;
  final List<ProductModel> products;
  final List<ProductModel> showedProducts;

  const ManageProductState({
    this.isLoading = true,
    this.products = const [],
    this.showedProducts = const [],
  });

  @override
  List<Object> get props => [isLoading, products, showedProducts];

  ManageProductState copyWith({
    bool? isLoading,
    List<ProductModel>? products,
    List<ProductModel>? showedProducts,
  }) {
    return ManageProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      showedProducts: showedProducts ?? this.showedProducts,
    );
  }
}
