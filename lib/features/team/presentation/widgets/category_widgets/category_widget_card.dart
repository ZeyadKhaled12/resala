import 'package:flutter/material.dart';
import 'package:resala/core/utils/app_constance.dart';
import 'package:resala/core/utils/assets_manager.dart';

class CategoryWidgetCard extends StatelessWidget {
  const CategoryWidgetCard(
      {Key? key,
      required this.statusActivity,
      required this.fun,
      required this.name,
      required this.points,
      required this.isFlag,
      required this.isPhotos,
      required this.isVideos})
      : super(key: key);
  final String statusActivity;
  final Function() fun;
  final int points;
  final String name;
  final bool isFlag;
  final bool isPhotos;
  final bool isVideos;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    if (isFlag) {
      color = Colors.blue;
    } else if (statusActivity == AppConstance.accept) {
      color = Colors.green;
    } else if (statusActivity == AppConstance.rejected) {
      color = Colors.red;
    } else if (statusActivity == AppConstance.pending) {
      color = Colors.orange;
    }

    return InkWell(
      onTap: fun,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SizedBox(
          height: 80,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: color,
                ),
                width: 26,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (statusActivity == AppConstance.accept)
                            Text('$points',
                                style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                )),
                          Row(
                            children: [
                              if (isVideos)
                                const Icon(Icons.play_arrow_outlined,
                                    color: Colors.black, size: 26),
                              if (isPhotos)
                                const Icon(Icons.camera_alt_outlined,
                                    color: Colors.black, size: 26)
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: FontAssets.sansFont,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
