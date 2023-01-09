import 'package:flutter/material.dart';

class LoginWidgetTextField extends StatelessWidget {
  const LoginWidgetTextField({Key? key, required this.hintText, required this.controller, this.isPass = false})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final bool isPass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: Container(
        height: 60,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.black, width: 2),
            color: Theme.of(context).secondaryHeaderColor),
        child: TextField(
          cursorColor: Colors.black,
          controller: controller,
          obscureText: isPass,
          style: const TextStyle(color: Colors.black, fontSize: 22),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 25),
              border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
