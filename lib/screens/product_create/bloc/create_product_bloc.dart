import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:book_store_manager/constant/enum.dart';
import 'package:equatable/equatable.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  CreateProductBloc() : super(const CreateProductState()) {
    on<CreateProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
