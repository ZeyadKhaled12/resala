import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resala/core/utils/enums.dart';
import 'package:resala/core/utils/general_widgets/general_widget_show_error_message.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/general_widgets/general_bottom_widgets/general_widget_bottom.dart';
import '../../domain/usecases/login_uc.dart';
import '../controller/login_bloc.dart';
import '../widgets/login_widgets/login_widget_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passcodeController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => sl<LoginBloc>(),
      child: Scaffold(
          body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.login.token.isNotEmpty) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (ctx) => GeneralWidgetBottom(
                        token: state.login.token,
                        isRef: state.login.isReferee)));
          }
        },
        buildWhen: (previous, current) =>
            previous.loginRequestState != current.loginRequestState,
        builder: (context, state) {
          return LoginWidgetBody(
              isLoading: context.watch<LoginBloc>().state.loginRequestState == RequestState.loading,
              loginFun: () {
                if(usernameController.text.isEmpty){
                  generalWidgetShowErrorMessage(context, 'Username is  required');
                }else if(passcodeController.text.isEmpty){
                  generalWidgetShowErrorMessage(context, 'Passcode is  required');
                }else{
                  context.read<LoginBloc>().add(LoginEvent(
                      loginParameters: LoginParameters(
                          userName: usernameController.text,
                          password: passcodeController.text)));
                }
              },
              usernameController: usernameController,
              passcodeController: passcodeController);
        },
      )),
    );
  }
}
