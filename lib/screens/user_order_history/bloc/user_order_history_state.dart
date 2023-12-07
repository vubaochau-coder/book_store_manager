part of 'user_order_history_bloc.dart';

sealed class UserOrderHistoryState extends Equatable {
  const UserOrderHistoryState();
  
  @override
  List<Object> get props => [];
}

final class UserOrderHistoryInitial extends UserOrderHistoryState {}
