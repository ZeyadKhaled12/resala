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


