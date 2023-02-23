
import 'package:flutter/material.dart';

import '../assets_manager.dart';

class GeneralTitleBodyWidget extends StatelessWidget {
  const GeneralTitleBodyWidget({Key? key, required this.title,
    required this.body}) : super(key: key);
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(title, style: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w900,
            fontFamily: FontAssets.arabicTitleFont
        )),
      ),
      body: body
    );
  }
}
