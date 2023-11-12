part of 'manage_order_bloc.dart';

sealed class ManageOrderState extends Equatable {
  const ManageOrderState();
  
  @override
  List<Object> get props => [];
}

final class ManageOrderInitial extends ManageOrderState {}
