import 'package:flutter/material.dart';

class RefereeScreen extends StatelessWidget {
  const RefereeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('REFEREE', style: TextStyle(
          color: Colors.black,
          fontSize: 26
        )),
      ),
    );
  }
}
