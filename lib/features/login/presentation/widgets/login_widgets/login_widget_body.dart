import 'package:flutter/material.dart';
import 'package:resala/core/utils/assets_manager.dart';
import 'package:resala/core/utils/general_widgets/general_widget_circular_view.dart';

import 'login_widget_text_field.dart';

class LoginWidgetBody extends StatelessWidget {
  const LoginWidgetBody(
      {Key? key,
      required this.isLoading,
      required this.loginFun,
      required this.usernameController,
      required this.passcodeController})
      : super(key: key);
  final Function() loginFun;
  final bool isLoading;
  final TextEditingController usernameController;
  final TextEditingController passcodeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _title,
                const Padding(padding: EdgeInsets.only(bottom: 48)),
                LoginWidgetTextField(
                    hintText: 'username', controller: usernameController),
                const Padding(padding: EdgeInsets.only(bottom: 28)),
                LoginWidgetTextField(
                    hintText: 'passcode',
                    controller: passcodeController,
                    isPass: true),
                const Padding(padding: EdgeInsets.only(bottom: 38)),
                _loginButton(context, loginFun)
              ],
            ),
          ),
          if(isLoading)
            const GeneralWidgetCircularView()
        ],
      ),
    );
  }
}

Text _title = const Text(
  'تسجيل الدخول',
  style: TextStyle(
      color: Colors.black,
      fontSize: 38,
      fontWeight: FontWeight.bold,
      fontFamily: FontAssets.arabicTitleFont),
  textAlign: TextAlign.center,
);

TextButton _loginButton(BuildContext context, Function() funLogin) =>
    TextButton(
        onPressed: funLogin,
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(15)),
            padding:
                const EdgeInsets.only(left: 34, right: 34, top: 15, bottom: 15),
            backgroundColor: Theme.of(context).secondaryHeaderColor),
        child: const Text(
          'دخول',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: FontAssets.sansFont,
              fontWeight: FontWeight.w900),
        ));

const BoxDecoration _boxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0XFFAFDAF2), Color(0XFF50BEFC)],
  ),
);
