import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store_manager/repositories/order_repository.dart';
import 'package:book_store_manager/utils/converter.dart';
import 'package:equatable/equatable.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  final OrderRepository _orderRepository;
  StreamSubscription? _orderDetailsStream;

  OrderDetailsBloc(this._orderRepository) : super(const OrderDetailsState()) {
    on<InitialDetailEvent>(_onInit);
    on<UpdateOrderStatusEvent>(_onUpdateStatus);
    on<ConfirmOrderEvent>(_onConfirm);
    on<CancelOrderEvent>(_onCancel);
  }

  @override
  Future<void> close() async {
    _orderDetailsStream?.cancel();
    _orderDetailsStream = null;
    super.close();
  }

  _onInit(InitialDetailEvent event, Emitter emit) {
    _orderDetailsStream =
        _orderRepository.orderStream(event.orderId).listen((snapshotEvent) {
      int status = cvToInt(snapshotEvent.data()!['status']);

      add(UpdateOrderStatusEvent(status: status));
    });
  }

  _onUpdateStatus(UpdateOrderStatusEvent event, Emitter emit) {
    emit(state.copyWith(isLoading: false, status: event.status));
  }

  _onConfirm(ConfirmOrderEvent event, Emitter emit) {}

  _onCancel(CancelOrderEvent event, Emitter emit) {}
}
