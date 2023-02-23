import 'package:flutter/material.dart';
import '../../domain/entities/category.dart';
import '../widgets/category_description_widgets/category_description_widget_card.dart';
import '../widgets/category_description_widgets/category_description_widget_image.dart';

class CategoryDescriptionScreen extends StatelessWidget {
  const CategoryDescriptionScreen({Key? key, required this.category})
      : super(key: key);
  final Category category;
  /*
  final Category category =  const Category(
      description: 'الزمالك بيفاوض القندوسي بقاله اربع شهور \nالأهلي اول ما اتدخل في الصفقة:',
      id: 0,
      name: 'الاطعام',
      totalScore: 40,
      activitiesCount: 2,
      imageUrl: 'https://resala-competitions.herokuapp.com/media/278573485_486774783234932_188433403922598362_n_FpaV73n.jpg',
      pointsCalculation: 'أهلك فى الكفتين والعالم كله برا، محدش بيدوق المُر \nعشان يدوقك طعم الشهد غيرهم',
      terms: 'انا  junior flutter developer لو معروض عليا شغل فلاتر ريموتلي لشركة في السعوديه\n هشتغل من مصر ب ١٠٠٠٠ جنيه في الشهر ده كويس ولا لأ \nملحوظة العقد مدته سنتين وده اول شغل ليا'
  );
   */

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
