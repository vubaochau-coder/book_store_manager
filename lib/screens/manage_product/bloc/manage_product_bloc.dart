import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manage_product_event.dart';
part 'manage_product_state.dart';

class ManageProductBloc extends Bloc<ManageProductEvent, ManageProductState> {
  ManageProductBloc() : super(ManageProductInitial()) {
    on<ManageProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
