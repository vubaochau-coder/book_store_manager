import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manage_order_event.dart';
part 'manage_order_state.dart';

class ManageOrderBloc extends Bloc<ManageOrderEvent, ManageOrderState> {
  ManageOrderBloc() : super(ManageOrderInitial()) {
    on<ManageOrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
