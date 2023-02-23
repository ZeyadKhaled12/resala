import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../screens/activity_screens/activity_show_file_screen.dart';

class ActivityWidgetAddFileCard extends StatelessWidget {
  const ActivityWidgetAddFileCard(
      {Key? key,
      required this.hintText,
      required this.iconData,
      required this.removeFun,
      this.videosPaths = const [],
      this.photosPaths = const [],
      required this.addFun})
      : super(key: key);

  final String hintText;
  final IconData iconData;
  final Function() addFun;
  final Function(int index) removeFun;
  final List<String> videosPaths;
  final List<String> photosPaths;

  @override
  Widget build(BuildContext context) {
    final List<String> files = videosPaths.isEmpty ? photosPaths : videosPaths;
    final isVideos = videosPaths.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: files.length >= 3 ? () {} : addFun,
        child: Container(
            width: double.infinity,
            height: files.isNotEmpty
                ? MediaQuery.of(context).size.height * 1 / 2.6
                : null,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10)),
            child: files.isNotEmpty
                ? filesWidget(
                    context, files, addFun, iconData, isVideos, removeFun)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Text(hintText,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                              fontFamily: FontAssets.sansFont)),
                      Icon(
                        iconData,
                        color: Colors.black.withOpacity(0.6),
                        size: 28,
                      )
                    ],
                  )),
      ),
    );
  }
}

Widget filesWidget(BuildContext context, List<String> files, Function() fun,
        IconData iconData, bool isVideos, Function(int index) removeFun) =>
    Column(
      children: [
        Expanded(
            child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (_, index) => InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return ActivityShowFileScreen(
                      isShowAct: false,
                      filePath: files[index],
                      isVideo: isVideos);
                }));
              },
              child: fileWidget(isVideos, files[index], removeFun, index)),
          itemCount: files.length,
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.black.withOpacity(0.6),
              size: 28,
            ),
            const Padding(padding: EdgeInsets.only(right: 20)),
            Text(
              isVideos ? '${files.length} / 3' : '${files.length} / 10',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );

Widget fileWidget(bool isVideos, String file, Function(int index) removeFun, int index) {
  Widget videoWidget = const Center(
      child: Icon(Icons.play_circle_filled, color: Colors.white, size: 54));

  Widget photoWidget = Image.file(File(file));

  return Container(
      height: 90,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.white, width: 8),
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Center(child: isVideos ? videoWidget : photoWidget),
          SizedBox(
            width: double.infinity,
            child: TextButton(onPressed: () => removeFun(index),
                child: const Icon(
                  Icons.delete,
                  size: 29,
                  color: Colors.black,
                ), style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.6)
                )),
          )
        ],
      ));
}
