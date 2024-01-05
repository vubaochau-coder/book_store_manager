part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  final String currentPass;
  final String newPass;
  final String confirmPass;

  final String currentErr;
  final String newErr;
  final String confirmErr;

  const ChangePasswordState({
    this.currentPass = '',
    this.newPass = '',
    this.confirmPass = '',
    this.currentErr = '',
    this.newErr = '',
    this.confirmErr = '',
  });

  @override
  List<Object> get props =>
      [currentPass, newPass, confirmPass, currentErr, newErr, confirmErr];

  ChangePasswordState copyWith({
    String? currentPass,
    String? newPass,
    String? confirmPass,
    String? currentErr,
    String? newErr,
    String? confirmErr,
  }) {
    return ChangePasswordState(
      currentPass: currentPass ?? this.currentPass,
      newPass: newPass ?? this.newPass,
      confirmPass: confirmPass ?? this.confirmPass,
      currentErr: currentErr ?? this.currentErr,
      newErr: newErr ?? this.newErr,
      confirmErr: confirmErr ?? this.confirmErr,
    );
  }
}
