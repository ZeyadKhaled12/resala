import 'package:flutter/material.dart';
import '../../domain/entities/activity.dart';
import '../../domain/entities/category.dart';
import '../widgets/category_widgets/category_widget_body.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {Key? key, required this.category, required this.activities, required this.token})
      : super(key: key);

  final Category category;
  final List<Activity> activities;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          child: AppBar(),
          preferredSize: const Size.fromHeight(0),
        ),
        body: CategoryWidgetBody(activities: activities, category: category, token: token));
  }
}
