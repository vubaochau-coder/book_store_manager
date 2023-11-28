part of 'order_details_bloc.dart';

class OrderDetailsState extends Equatable {
  final int status;
  final bool isLoading;

  const OrderDetailsState({
    this.status = 0,
    this.isLoading = true,
  });

  @override
  List<Object> get props => [status, isLoading];

  OrderDetailsState copyWith({
    int? status,
    bool? isLoading,
  }) {
    return OrderDetailsState(
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
