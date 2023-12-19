import 'package:bloc/bloc.dart';
import 'package:book_store_manager/models/product_model.dart';
import 'package:book_store_manager/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository _productRepository;

  ProductDetailBloc(this._productRepository)
      : super(const ProductDetailState()) {
    on<InitialEvent>(_onInitial);
  }

  _onInitial(InitialEvent event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));

    ProductModel productData =
        await _productRepository.getProduct(event.productId);

    await Future.delayed(const Duration(seconds: 3));

    emit(state.copyWith(
      isLoading: false,
      productData: productData,
    ));
  }
}
