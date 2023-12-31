part of 'statistic_bloc.dart';

class StatisticState extends Equatable {
  final bool isLoading;
  final DateTime? selectedMonth;
  final List<OrderModel> orders;

  const StatisticState({
    this.isLoading = true,
    this.selectedMonth,
    this.orders = const [],
  });

  @override
  List<Object?> get props => [isLoading, selectedMonth, orders];

  StatisticState copyWith({
    bool? isLoading,
    DateTime? selectedMonth,
    List<OrderModel>? orders,
  }) {
    return StatisticState(
      isLoading: isLoading ?? this.isLoading,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      orders: orders ?? this.orders,
    );
  }
}
