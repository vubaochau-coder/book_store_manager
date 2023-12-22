import 'package:bloc/bloc.dart';
import 'package:book_store_manager/extensions/datetime_ex.dart';
import 'package:book_store_manager/models/import_product_model.dart';
import 'package:book_store_manager/repositories/import_repository.dart';
import 'package:book_store_manager/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'import_product_event.dart';
part 'import_product_state.dart';

class ImportProductBloc extends Bloc<ImportProductEvent, ImportProductState> {
  final ImportRepository _importRepository;
  final ProductRepository _productRepository;

  ImportProductBloc(this._importRepository, this._productRepository)
      : super(const ImportProductState()) {
    on<LoadImportProductHistory>(_onLoadHistory);
  }

  _onLoadHistory(LoadImportProductHistory event, Emitter emit) async {
    if (event.time.getMonthAndYear() != state.time?.getMonthAndYear()) {
      emit(state.copyWith(isLoading: true, time: event.time));

      List<ImportProductModel> history =
          await _importRepository.getInportHistory(event.time);

      emit(state.copyWith(isLoading: false, history: history));
    }
  }
}
