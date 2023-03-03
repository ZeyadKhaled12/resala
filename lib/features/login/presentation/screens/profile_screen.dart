import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../../../core/utils/general_widgets/general_title_body_widget.dart';
import '../../domain/entities/login.dart';
import '../controller/login_bloc.dart';
import '../widgets/profile_widgets/profile_widget_body.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.login}) : super(key: key);
  final Login login;

  @override
  Widget build(BuildContext context) {
    return GeneralTitleBodyWidget(
        title: 'الملف الشخصي',
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: BlocProvider(
            create: (context) => sl<LoginBloc>(),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return ProfileWidgetBody(
                    logoutFun: ()async{
                  context.read<LoginBloc>().add(
                      const LogoutEvent(noParameters: NoParameters()));
                  await Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                }, login: login);
              },
            ),
          ),
        ));
  }
}
