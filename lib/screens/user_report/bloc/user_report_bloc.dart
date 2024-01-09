import 'package:bloc/bloc.dart';
import 'package:book_store_manager/models/user_report_model.dart';
import 'package:book_store_manager/repositories/user_report_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_report_event.dart';
part 'user_report_state.dart';

class UserReportBloc extends Bloc<UserReportEvent, UserReportState> {
  final UserReportRepository _reportRepository;

  UserReportBloc(this._reportRepository) : super(const UserReportState()) {
    on<InititalEvent>(_onInitital);
    on<HideFeedbackEvent>(_onHideFeedback);
    on<ReadReportEvent>(_onReadReport);
  }

  _onInitital(InititalEvent event, Emitter emit) async {
    final List<UserReportModel> reports =
        await _reportRepository.getUserReport(0);

    emit(state.copyWith(false, reports));
  }

  _onHideFeedback(HideFeedbackEvent event, Emitter emit) {}

  _onReadReport(ReadReportEvent event, Emitter emit) {}
}
