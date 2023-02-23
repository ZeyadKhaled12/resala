import 'package:flutter/material.dart';

class ActivityWidgetAddButton extends StatelessWidget {
  const ActivityWidgetAddButton({Key? key, required this.fun}) : super(key: key);
  final Function() fun;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: fun,
        style: ElevatedButton.styleFrom(
          primary: Colors.grey.withOpacity(0.5)
        ),
        child: Text('أضافة حركة/حدث', style: TextStyle(
          color: Colors.black.withOpacity(0.6),
          fontWeight: FontWeight.bold,
          fontSize: 26
        )),
      ),
    );
  }
}
