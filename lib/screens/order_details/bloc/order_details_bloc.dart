import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store_manager/repositories/order_repository.dart';
import 'package:book_store_manager/utils/converter.dart';
import 'package:book_store_manager/utils/dialog_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    on<PrepareConfirmOrderEvent>(_onPrepareConfirm);
    on<DeliverConfirmOrderEvent>(_onDeliverConfirm);
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

  _onConfirm(ConfirmOrderEvent event, Emitter emit) async {
    DialogUtils.showLoading();
    await _orderRepository.confirmOrder(event.orderId);
    DialogUtils.hideLoading();
    Fluttertoast.showToast(
      msg: "Xác nhận đơn hàng thành công",
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  _onCancel(CancelOrderEvent event, Emitter emit) async {
    DialogUtils.showLoading();
    await _orderRepository.cancelOrder(event.orderId);
    DialogUtils.hideLoading();
    Fluttertoast.showToast(
      msg: "Hủy đơn hàng thành công",
      backgroundColor: Colors.red[400],
      textColor: Colors.white,
    );
  }

  _onPrepareConfirm(PrepareConfirmOrderEvent event, Emitter emit) async {
    DialogUtils.showLoading();
    await _orderRepository.preparingConfirmOrder(event.orderId);
    DialogUtils.hideLoading();
    Fluttertoast.showToast(
      msg: "Đơn hàng đã chuyển sang trạng thái chờ lấy",
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  _onDeliverConfirm(DeliverConfirmOrderEvent event, Emitter emit) async {
    DialogUtils.showLoading();
    await _orderRepository.preparedConfirmOrder(event.orderId);
    DialogUtils.hideLoading();
    Fluttertoast.showToast(
      msg: "Đơn hàng đang được vận chuyển",
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }
}
