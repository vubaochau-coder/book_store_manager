part of 'order_details_bloc.dart';

sealed class OrderDetailsEvent extends Equatable {
  const OrderDetailsEvent();

  @override
  List<Object> get props => [];
}

class InitialDetailEvent extends OrderDetailsEvent {
  final String orderId;

  const InitialDetailEvent({required this.orderId});
}

class UpdateOrderStatusEvent extends OrderDetailsEvent {
  final int status;

  const UpdateOrderStatusEvent({required this.status});
}

class ConfirmOrderEvent extends OrderDetailsEvent {
  final String orderId;

  const ConfirmOrderEvent({required this.orderId});
}

class CancelOrderEvent extends OrderDetailsEvent {
  final String orderId;

  const CancelOrderEvent({required this.orderId});
}
