import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_order_history_event.dart';
part 'user_order_history_state.dart';

class UserOrderHistoryBloc extends Bloc<UserOrderHistoryEvent, UserOrderHistoryState> {
  UserOrderHistoryBloc() : super(UserOrderHistoryInitial()) {
    on<UserOrderHistoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
