part of 'user_order_history_bloc.dart';

sealed class UserOrderHistoryEvent extends Equatable {
  const UserOrderHistoryEvent();

  @override
  List<Object> get props => [];
}

class InititalEvent extends UserOrderHistoryEvent {
  final String userId;

  const InititalEvent({required this.userId});
}

class UpdateViewTypeEvent extends UserOrderHistoryEvent {
  final OrderHistorySortType viewType;

  const UpdateViewTypeEvent({required this.viewType});
}
