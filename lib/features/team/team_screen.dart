import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('TEAM', style: TextStyle(
            color: Colors.black,
            fontSize: 26
        )),
      ),
    );
  }
}