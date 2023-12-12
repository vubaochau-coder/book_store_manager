import 'package:bloc/bloc.dart';
import 'package:book_store_manager/constant/enum.dart';
import 'package:book_store_manager/models/order_model.dart';
import 'package:book_store_manager/repositories/order_repository.dart';
import 'package:diacritic/diacritic.dart';
import 'package:equatable/equatable.dart';

part 'done_order_event.dart';
part 'done_order_state.dart';

class DoneOrderBloc extends Bloc<DoneOrderEvent, DoneOrderState> {
  final OrderRepository _orderRepository;

  DoneOrderBloc(this._orderRepository) : super(const DoneOrderState()) {
    on<InitialEvent>(_onInitital);
    on<UpdateSelectedMonthEvent>(_onUpdateSelectedMonth);
    on<UpdateViewTypeEvent>(_onUpdateViewType);
    on<SearchingOrderEvent>(_onSearching);
  }

  _onInitital(InitialEvent event, Emitter emit) async {}

  _onUpdateSelectedMonth(UpdateSelectedMonthEvent event, Emitter emit) async {}

  _onUpdateViewType(UpdateViewTypeEvent event, Emitter emit) {
    if (event.viewType != state.viewType) {
      emit(state.copyWith(viewType: event.viewType));

      List<OrderModel> newShowedOrders = [];

      switch (event.viewType) {
        case OrderHistorySortType.all:
          newShowedOrders = List.from(state.orders);
          break;
        case OrderHistorySortType.complete:
          newShowedOrders = List.from(state.completeOrders);
          break;
        case OrderHistorySortType.cancel:
          newShowedOrders = List.from(state.cancelOrders);
          break;
      }

      if (state.searchQuery.isNotEmpty) {
        for (var ele in newShowedOrders) {
          String userName = removeDiacritics(ele.userName.toLowerCase());
          String userPhone = ele.phone;

          if (!userName.contains(state.searchQuery) &&
              !userPhone.contains(state.searchQuery)) {
            newShowedOrders.remove(ele);
          }
        }
      }

      emit(state.copyWith(showedOrders: newShowedOrders));
    }
  }

  _onSearching(SearchingOrderEvent event, Emitter emit) {
    emit(state.copyWith(searchQuery: event.query));

    List<OrderModel> showedOrders = [];
    switch (state.viewType) {
      case OrderHistorySortType.all:
        showedOrders = List.from(state.orders);
        break;
      case OrderHistorySortType.complete:
        showedOrders = List.from(state.completeOrders);
        break;
      case OrderHistorySortType.cancel:
        showedOrders = List.from(state.cancelOrders);
        break;
    }

    for (var ele in showedOrders) {
      String userName = removeDiacritics(ele.userName.toLowerCase());
      String userPhone = ele.phone;

      if (!userName.contains(state.searchQuery) &&
          !userPhone.contains(state.searchQuery)) {
        showedOrders.remove(ele);
      }
    }

    emit(state.copyWith(showedOrders: showedOrders));
  }
}
