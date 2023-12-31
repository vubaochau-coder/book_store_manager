import 'package:bloc/bloc.dart';
import 'package:book_store_manager/models/order_model.dart';
import 'package:book_store_manager/repositories/order_repository.dart';
import 'package:equatable/equatable.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  final OrderRepository _orderRepository;

  StatisticBloc(this._orderRepository) : super(const StatisticState()) {
    on<LoadStatisticData>(_onLoadData);
  }

  _onLoadData(LoadStatisticData event, Emitter emit) async {
    if (event.selectedMonth != state.selectedMonth) {
      emit(state.copyWith(isLoading: true, selectedMonth: event.selectedMonth));

      final List<OrderModel> orders =
          await _orderRepository.getDoneOrdersOfMonth(state.selectedMonth!);

      emit(state.copyWith(isLoading: false, orders: orders));
    }
  }
}
