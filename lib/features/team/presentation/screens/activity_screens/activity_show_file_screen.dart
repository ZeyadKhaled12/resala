import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/utils/general_widgets/general_widget_video_player.dart';

class ActivityShowFileScreen extends StatelessWidget {
  const ActivityShowFileScreen(
      {Key? key, required this.filePath, required this.isVideo,
        required this.isShowAct})
      : super(key: key);
  final String filePath;
  final bool isVideo;
  final bool isShowAct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: isVideo
            ? GeneralWidgetVideoPlayer(file: File(filePath), isShowAct: isShowAct, url: filePath)
            : isShowAct?Image.network(filePath):Image.file(File(filePath)),
      ),
    );
  }
}
