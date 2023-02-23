import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_manager.dart';

class ActivityWidgetTextCard extends StatelessWidget {
  const ActivityWidgetTextCard({Key? key, required this.text})
      : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: SingleChildScrollView(
              child: Text(
                  text, style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  fontFamily: FontAssets.sansFont)
              ),
            ),
          ))
    );
  }
}
