part of 'done_order_bloc.dart';

sealed class DoneOrderEvent extends Equatable {
  const DoneOrderEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends DoneOrderEvent {}

class UpdateSelectedMonthEvent extends DoneOrderEvent {
  final DateTime selectedMonth;

  const UpdateSelectedMonthEvent({required this.selectedMonth});
}

class UpdateViewTypeEvent extends DoneOrderEvent {
  final OrderHistorySortType viewType;

  const UpdateViewTypeEvent({required this.viewType});
}

class SearchingOrderEvent extends DoneOrderEvent {
  final String query;

  const SearchingOrderEvent({required this.query});
}
