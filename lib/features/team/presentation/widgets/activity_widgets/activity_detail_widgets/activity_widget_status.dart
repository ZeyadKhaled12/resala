
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_constance.dart';
import '../../../../../../core/utils/assets_manager.dart';

class ActivityWidgetStatus extends StatelessWidget {
  const ActivityWidgetStatus({Key? key, required this.status,
    required this.points, required this.fun}) : super(key: key);
  final String status;
  final int points;
  final Function() fun;

  @override
  Widget build(BuildContext context) {

    Color color = Colors.white;
    if(status == AppConstance.flag){
      color =  Colors.blue;
    }
    else if(status == AppConstance.accept){
      color = Colors.green;
    }else if(status ==  AppConstance.rejected){
      color = Colors.red;
    }else if(status ==  AppConstance.pending){
      color = Colors.orange;
    }

    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    status == AppConstance.pending || status == AppConstance.flag?
                    const SizedBox():
                    IconButton(onPressed: fun,
                        icon: const Icon(Icons.warning, color:
                        Colors.white, size: 30)),
                    Column(
                      children: [
                        Text(
                            status, style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: FontAssets.sansFont)
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 15)),
                        if(status == AppConstance.accept)
                          Text(
                            '$points', style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: FontAssets.sansFont)
                        ),
                      ],
                    ),
                    const SizedBox()
                  ],
                )
              ),
            ))
    );
  }
}
