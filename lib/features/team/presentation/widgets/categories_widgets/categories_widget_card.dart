import 'package:flutter/material.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../domain/entities/category.dart';
import '../../screens/category_description_screen.dart';

class CategoriesWidgetCard extends StatelessWidget {
  const CategoriesWidgetCard(
      {Key? key,
      this.isTitle = false,
      this.fun, this.category, this.totalScore, this.activitiesCount})
      : super(key: key);


  final Category? category;
  final bool isTitle;
  final int? totalScore;
  final int? activitiesCount;
  final Function()? fun;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        padding: const EdgeInsets.only(left: 20, bottom: 15),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(25)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isTitle)
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) =>
                                CategoryDescriptionScreen(category: category!)));
                  },
                  icon: const Icon(Icons.info_outline, size: 28)),
            if (isTitle) const Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: isTitle ? 15 : 30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(category == null?'$totalScore':'${category!.totalScore}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 29,
                                fontFamily: FontAssets.sansFont,
                                fontWeight: FontWeight.bold)),
                        const Padding(padding: EdgeInsets.only(bottom: 22)),
                        Text(activitiesCount != null?
                        '$activitiesCount':
                        '${category!.activitiesCount}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: FontAssets.sansFont,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(isTitle?'نقاطك':category!.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: isTitle ? 29 : 35,
                              fontWeight: FontWeight.w900,
                              fontFamily: FontAssets.sansFont,
                            )),
                        const Padding(padding: EdgeInsets.only(bottom: 22)),
                        const Text('عدد الحركات',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              fontFamily: FontAssets.sansFont,
                            )),
                      ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
