import 'package:flutter/material.dart';
import '../../domain/entities/category.dart';
import '../widgets/category_description_widgets/category_description_widget_card.dart';
import '../widgets/category_description_widgets/category_description_widget_image.dart';

class CategoryDescriptionScreen extends StatelessWidget {
  const CategoryDescriptionScreen({Key? key, required this.category})
      : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.black,
        ),
        preferredSize: const Size.fromHeight(0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryDescriptionWidgetImage(
              title: category.name,
              imageUrl: category.imageUrl,
            ),
            CategoryDescriptionWidgetCard(body: category.description, title: 'الوصف'),
            CategoryDescriptionWidgetCard(body: category.pointsCalculation, title: 'طريقة حساب النقط'),
            CategoryDescriptionWidgetCard(body: category.terms, title: 'الشروط'),
            const Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      ),
    );
  }
}
