part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String orderNumber;
  final String orderCompleteNumber;
  final double revenue;

  const HomeState({
    this.orderNumber = "XX",
    this.orderCompleteNumber = "XX",
    this.revenue = 0,
  });

  @override
  List<Object> get props => [orderNumber, orderCompleteNumber, revenue];

  HomeState copyWith({
    String? orderNumber,
    String? orderCompleteNumber,
    double? revenue,
  }) {
    return HomeState(
      orderNumber: orderNumber ?? this.orderNumber,
      orderCompleteNumber: orderCompleteNumber ?? this.orderCompleteNumber,
      revenue: revenue ?? this.revenue,
    );
  }
}
