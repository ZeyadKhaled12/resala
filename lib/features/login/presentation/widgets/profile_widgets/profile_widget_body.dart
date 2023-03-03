import 'package:flutter/material.dart';
import 'package:resala/features/login/domain/entities/login.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../team/presentation/widgets/category_description_widgets/category_description_widget_card.dart';
import '../../../../team/presentation/widgets/category_description_widgets/category_description_widget_image.dart';

class ProfileWidgetBody extends StatelessWidget {
  const ProfileWidgetBody(
      {Key? key, required this.logoutFun, required this.login})
      : super(key: key);
  final Function() logoutFun;
  final Login login;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(!login.isReferee)
              Column(
                children: [
                  CategoryDescriptionWidgetImage(
                    title: login.name,
                    imageUrl: login.image,
                  ),
                  CategoryDescriptionWidgetCard(
                      title: 'اسم النشاط', body: login.activityName),
                  CategoryDescriptionWidgetCard(title: 'الفرع', body: login.brunch),
                  CategoryDescriptionWidgetCard(
                      title: 'الاعضاء', body: convertListToString(login.members)),
                  CategoryDescriptionWidgetCard(
                      title: 'القادة', body: convertListToString(login.leaders))
                ],
              ),
            logoutBtn(logoutFun)
          ],
        ),
      ),
    );
  }
}

String convertListToString(List list) {
  String string = '';
  for (var element in list) {
    string = string + '1- $element\n';
  }
  return string;
}

Widget logoutBtn(Function() logoutFun) {
  return TextButton(
      onPressed: logoutFun,
      child: const Text('تسجيل الخروج',
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: FontAssets.arabicTitleFont)));
}
