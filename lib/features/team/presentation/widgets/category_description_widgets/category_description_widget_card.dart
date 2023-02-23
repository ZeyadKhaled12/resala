import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';

class CategoryDescriptionWidgetCard extends StatelessWidget {
  const CategoryDescriptionWidgetCard(
      {Key? key, required this.title, required this.body})
      : super(key: key);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                      fontFamily: FontAssets.arabicTitleFont),
                  textAlign: TextAlign.end),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              body,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: FontAssets.sansFont),
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );
  }
}
