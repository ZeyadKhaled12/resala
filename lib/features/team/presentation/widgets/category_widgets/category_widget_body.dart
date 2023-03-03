import 'package:flutter/material.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../domain/entities/activity.dart';
import '../../../domain/entities/category.dart';
import '../../screens/activity_screens/activity_detail_screen.dart';
import '../../screens/activity_screens/add_activity_screen.dart';
import '../categories_widgets/categories_widget_card.dart';
import 'category_widget_card.dart';

class CategoryWidgetBody extends StatelessWidget {
  const CategoryWidgetBody(
      {Key? key,
      required this.category,
      required this.activities,
      required this.token})
      : super(key: key);
  final Category category;
  final String token;
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 15)),
          CategoriesWidgetCard(category: category),
          const Padding(padding: EdgeInsets.only(top: 15)),
          _addActivityBtn(context, token, category.id, activities.length),
          const Padding(padding: EdgeInsets.only(top: 15)),
          Expanded(
            child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return CategoryWidgetCard(
                      statusActivity: activities[index].status,
                      isFlag: activities[index].isFlag,
                      points: activities[index].points,
                      isPhotos: activities[index].activityPhotos.isNotEmpty,
                      isVideos: activities[index].activityVideos.isNotEmpty,
                      name: activities[index].name,
                      fun: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivityDetailScreen(
                                isRef: false,
                                    activity: activities[index],
                                    indexActivity: index,
                                    token: token,
                                  ))));
                },
                itemCount: activities.length),
          )
        ],
      ),
    );
  }
}

Widget _addActivityBtn(BuildContext context, String token, int categoryId,
        int activitiesLength) =>
    TextButton(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddActivityScreen(
                  token: token,
                  categoryId: categoryId,
                  activitiesLength: activitiesLength))),
      child: const Text('أضافة حركة/حدث',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 22,
              fontFamily: FontAssets.sansFont),
          textAlign: TextAlign.center),
      style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).cardColor,
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    );
