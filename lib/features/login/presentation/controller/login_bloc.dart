import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/login.dart';
import '../../domain/usecases/login_uc.dart';
part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<RegisterEvent, LoginState> {
  final LoginUc loginUc;

  LoginBloc(this.loginUc) : super(const LoginState()) {
    on<LoginEvent>(_login);
  }

  FutureOr<void> _login(LoginEvent event, Emitter<LoginState> emit) async {
    final result = await loginUc.call(event.loginParameters);
    result.fold(
        (l) => emit(state.copyWith(
              loginRequestState: RequestState.error,
              errorLoginMessage: l.message,
            )),
        (r) => emit(
            state.copyWith(login: r, loginRequestState: RequestState.loaded)));
  }
}
