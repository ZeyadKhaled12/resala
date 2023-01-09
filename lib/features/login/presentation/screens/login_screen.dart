import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/enums.dart';
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
          body: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
            previous.loginRequestState != current.loginRequestState,
        builder: (context, state) => LoginWidgetBody(
            loginFun: () {
              context.read<LoginBloc>().add(LoginEvent(
                  loginParameters: LoginParameters(
                      userName: usernameController.text,
                      password: passcodeController.text)));
              /*
               Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TeamScreen()),
                  );
               */
              switch(BlocProvider.of<LoginBloc>(context, listen: true).state.loginRequestState){
                case RequestState.loading:
                  print('Loading');
                  break;
                case RequestState.loaded:
                  print('loaded');
                  break;
                case RequestState.error:
                  print('Error');
                  break;
              }
              },
            usernameController: usernameController,
            passcodeController: passcodeController),
      )),
    );
  }
}
