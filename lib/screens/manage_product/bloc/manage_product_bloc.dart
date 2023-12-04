import 'package:bloc/bloc.dart';
import 'package:book_store_manager/models/product_model.dart';
import 'package:book_store_manager/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:diacritic/diacritic.dart';

part 'manage_product_event.dart';
part 'manage_product_state.dart';

class ManageProductBloc extends Bloc<ManageProductEvent, ManageProductState> {
  final ProductRepository _productRepo;

  ManageProductBloc(this._productRepo) : super(const ManageProductState()) {
    on<ManageProductLoading>(_onLoading);
    on<SearchProductEvent>(_onSearching);
  }

  _onLoading(ManageProductLoading event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));

    final List<ProductModel> products = await _productRepo.getAllProduct();

    emit(state.copyWith(
      isLoading: false,
      products: products,
      showedProducts: products,
    ));
  }

  _onSearching(SearchProductEvent event, Emitter emit) {
    List<ProductModel> newShowedProducts = [];

    if (event.query.isEmpty) {
      newShowedProducts = List.from(state.products);
      emit(state.copyWith(showedProducts: newShowedProducts));
    } else {
      String query = removeDiacritics(event.query);
      for (var ele in state.products) {
        if (ele.searchKey.contains(query)) {
          newShowedProducts.add(ele);
        }
      }
      emit(state.copyWith(showedProducts: newShowedProducts));
    }
  }
}
