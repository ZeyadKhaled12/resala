import 'package:flutter/material.dart';
import 'package:resala/core/utils/assets_manager.dart';
import 'package:resala/features/referee/domain/usecases/get_ref_activities_uc.dart';
import 'package:resala/features/referee/presentation/screens/ref_activities_screen.dart';

import '../../../../../core/utils/enums.dart';

class RefActivitiesWidgetCard extends StatelessWidget {
  const RefActivitiesWidgetCard(
      {Key? key,
      required this.title,
      required this.colorOfNum,
      required this.value,
      required this.categoryId,
      required this.token,
      required this.status})
      : super(key: key);
  final String title;
  final Color colorOfNum;
  final int value;
  final int categoryId;
  final String token;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () async =>
        await Navigator.push(context, MaterialPageRoute(builder:
        (context) => RefActivitiesScreen(
          getRefActivitiesParameters: GetRefActivitiesParameters(
            token: token,
            status: status,
            categoryId: categoryId
          ),
        ),
        ))
        ,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(25)),
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: FontAssets.arabicTitleFont)),
                const Padding(padding: EdgeInsets.only(right: 20)),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    backgroundColor: colorOfNum,
                    radius: 15,
                    child: Text(
                      '$value',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
