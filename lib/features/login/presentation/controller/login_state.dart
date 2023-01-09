part of 'login_bloc.dart';

class LoginState extends Equatable {
  final Login login;
  final RequestState loginRequestState;
  final String errorLoginMessage;

  const LoginState({this.login =
  const Login(userName: '', isReferee: false, isTeam: false, token: ''),
    this.loginRequestState = RequestState.loading,
    this.errorLoginMessage = ''});

  LoginState copyWith({Login? login,
    RequestState? loginRequestState,
    String? errorLoginMessage}) {
    return LoginState(
      login: login ?? this.login,
      loginRequestState: loginRequestState ?? this.loginRequestState,
      errorLoginMessage: errorLoginMessage ?? this.errorLoginMessage,
    );
  }

  @override
  List<Object> get props => [login, loginRequestState, errorLoginMessage];
}
