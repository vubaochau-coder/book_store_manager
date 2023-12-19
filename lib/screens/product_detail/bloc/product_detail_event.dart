part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends ProductDetailEvent {
  final String productId;

  const InitialEvent({required this.productId});
}
