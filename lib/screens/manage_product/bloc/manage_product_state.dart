part of 'manage_product_bloc.dart';

sealed class ManageProductState extends Equatable {
  const ManageProductState();
  
  @override
  List<Object> get props => [];
}

final class ManageProductInitial extends ManageProductState {}
