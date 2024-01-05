import 'package:bloc/bloc.dart';
import 'package:book_store_manager/repositories/services/authentication_service.dart';
import 'package:equatable/equatable.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final AuthenticationService _authService;

  ChangePasswordBloc(this._authService) : super(const ChangePasswordState()) {
    on<UpdateCurrentPassword>(_onUpdateCurrent);
    on<UpdateNewPassword>(_onUpdateNew);
    on<UpdateConfirmPassword>(_onUpdateConfirm);
    on<ConfirmChangePassword>(_onChange);
  }

  _onUpdateCurrent(UpdateCurrentPassword event, Emitter emit) {
    emit(state.copyWith(currentPass: event.currentPass, currentErr: ''));
  }

  _onUpdateNew(UpdateNewPassword event, Emitter emit) {
    emit(state.copyWith(newPass: event.newPass, newErr: ''));
  }

  _onUpdateConfirm(UpdateConfirmPassword event, Emitter emit) {
    emit(state.copyWith(confirmPass: event.confirmPass, confirmErr: ''));
  }

  _onChange(ConfirmChangePassword event, Emitter emit) {
    bool hasErr = false;

    if (state.currentPass.isEmpty) {
      emit(state.copyWith(currentErr: 'Vui lòng nhập mật khẩu cũ'));
      return;
    }

    if (state.newPass.isEmpty) {
      emit(state.copyWith(newErr: 'Vui lòng nhập mật khẩu mới'));
      hasErr = true;
    }

    if (state.confirmPass.isEmpty) {
      emit(state.copyWith(confirmErr: 'Vui lòng xác nhận mật khẩu mới'));
      hasErr = true;
    }
  }
}
