part of 'login_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends RegisterEvent {
  final LoginParameters loginParameters;

  const LoginEvent({required this.loginParameters});

  @override
  List<Object> get props => [loginParameters];
}

class CaptureTokenEvent extends RegisterEvent {
  final Login login;

  const CaptureTokenEvent({required this.login});

  @override
  List<Object> get props => [login];
}

class CheckIfLoginBeforeEvent extends RegisterEvent {
  final NoParameters noParameters;

  const CheckIfLoginBeforeEvent({required this.noParameters});

  @override
  List<Object> get props => [noParameters];
}



