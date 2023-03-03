import 'package:flutter/material.dart';
import 'package:resala/core/utils/app_constance.dart';
import 'package:resala/core/utils/enums.dart';
import '../../domain/entities/ref_category.dart';
import '../widgets/ref_activities_widgets/ref_activities_window_widget_card.dart';

class RefActivitiesWindowScreen extends StatelessWidget {
  const RefActivitiesWindowScreen(
      {Key? key, required this.token, required this.refCategory})
      : super(key: key);
  final RefCategory refCategory;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RefActivitiesWidgetCard(
                title: 'جديد',
                token: token,
                categoryId: refCategory.id,
                status: AppConstance.pending,
                value: refCategory.pendingCount,
                colorOfNum: Colors.orange,
              ),
              RefActivitiesWidgetCard(
                title: 'تمت',
                token: token,
                categoryId: refCategory.id,
                status: AppConstance.accept,
                value: refCategory.acceptedCount,
                colorOfNum: Colors.green,
              ),
              RefActivitiesWidgetCard(
                title: 'اعتراض',
                token: token,
                categoryId: refCategory.id,
                status: AppConstance.flag,
                value: refCategory.objectedCount,
                colorOfNum: Colors.blue,
              ),
              RefActivitiesWidgetCard(
                title: 'مرفوض',
                token: token,
                categoryId: refCategory.id,
                status: AppConstance.rejected,
                value: refCategory.rejectedCount,
                colorOfNum: Colors.red,
              ),
            ],
          )),
    );
  }
}
