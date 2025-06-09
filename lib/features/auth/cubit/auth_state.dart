import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';

class AuthState extends Equatable {
  final RequestStatus loginStatus;
  final String loginErrorMessage;

  const AuthState({
    this.loginStatus = RequestStatus.initial,
    this.loginErrorMessage = '',
  });

  AuthState copyWith({RequestStatus? loginStatus, String? loginErrorMessage}) {
    return AuthState(
      loginStatus: loginStatus ?? this.loginStatus,
      loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
    );
  }

  @override
  List<Object> get props => [loginStatus, loginErrorMessage];
}
