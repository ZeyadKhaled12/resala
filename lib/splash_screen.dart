import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/services_locator.dart';
import 'core/usecase/base_use_case.dart';
import 'core/utils/assets_manager.dart';
import 'core/utils/enums.dart';
import 'core/utils/general_widgets/general_bottom_widgets/general_widget_bottom.dart';
import 'core/utils/general_widgets/general_widget_animation_opacity.dart';
import 'features/login/presentation/controller/login_bloc.dart';
import 'features/login/presentation/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: Colors.black),
      ),
      body: BlocProvider(
          create: (ctx) => sl<LoginBloc>()
            ..add(const CheckIfLoginBeforeEvent(noParameters: NoParameters())),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.loginRequestState == RequestState.loaded) {
                Future.delayed(const Duration(seconds: 5), () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => state.login.token.isEmpty
                              ? const LoginScreen()
                              : GeneralWidgetBottom(
                                  token: state.login.token,
                                  isRef: state.login.isReferee)));
                });
              }
            },
            buildWhen: (prev, current) =>
                prev.loginRequestState != current.loginRequestState,
            builder: (context, state) {
              switch (state.loginRequestState) {
                case RequestState.loading:
                  return body;
                case RequestState.loaded:
                  return body;
                case RequestState.error:
                  return body;
              }
            },
          )),
    );
  }
}

Widget body = const GeneralWidgetAnimationOpacity(
    widgetOpacity: Center(
      child: Image(image: AssetImage(ImagesAssets.resalaLogo), height: 60),
    ),
    seconds: 3);
