import 'package:flutter/material.dart';

import 'features/login/presentation/screens/login_screen.dart';


class Resala extends StatelessWidget {
  const Resala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0XFF222647),
            secondaryHeaderColor: const Color(0XFFC3F8FF),
            colorScheme: ColorScheme.fromSwatch(
                backgroundColor: const Color(0XFF383D6E)
            ),
            hintColor: const Color(0XFF386E3A),
            textSelectionTheme:
            const TextSelectionThemeData(selectionColor: Color(0XFFDDD9B8))),
        home: const LoginScreen());
  }
}