import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';

class CategoryDescriptionWidgetImage extends StatelessWidget {
  const CategoryDescriptionWidgetImage(
      {Key? key, required this.imageUrl, required this.title})
      : super(key: key);
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 1 / 3,
      child: Stack(
        children: [
          Image(image: NetworkImage(imageUrl)),
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1 / 3,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.8),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    child: Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: FontAssets.arabicTitleFont,
                            fontWeight: FontWeight.w900)),
                    padding: const EdgeInsets.all(25),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
