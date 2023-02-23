import 'package:flutter/material.dart';
import '../../../domain/entities/activity.dart';
import '../../../domain/entities/category.dart';
import '../../screens/category_screen.dart';
import 'categories_widget_card.dart';

class CategoriesWidgetBody extends StatelessWidget {
  const CategoriesWidgetBody({Key? key, required this.categories, required this.activities,
    required this.token})
      : super(key: key);
  final List<Category> categories;
  final String token;
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {

    int totalPoints = 0;
    int activitiesCount = 0;

    for (var element in categories) {
      totalPoints = totalPoints + element.totalScore;
      activitiesCount = activitiesCount + element.activitiesCount;
    }

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 15)),
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CategoriesWidgetCard(
                activitiesCount: activitiesCount,
                totalScore: totalPoints,
                isTitle: true,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          Expanded(
            child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CategoriesWidgetCard(
                      category: categories[index],
                        fun: () {
                          List<Activity> activities = [];
                          for (var element in this.activities) {
                            if(element.categoryId == categories[index].id){
                              activities.add(element);
                            }
                          }
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) {
                            return CategoryScreen(category: categories[index], activities: activities, token: token);
                          }));
                        }),
                  );
                },
                itemCount: categories.length),
          )
        ],
      ),
    );
  }
}
