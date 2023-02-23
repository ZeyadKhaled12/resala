
import 'package:flutter/material.dart';
import '../activity_add_show_file_widgets/activity_widget_add_file_card.dart';
import 'activity_widget_text_field.dart';

class AddActivityWidgetBody extends StatelessWidget {
  const AddActivityWidgetBody({Key? key,
    required this.controllers,
    required this.photosPaths,
    required this.videosPaths,
    required this.addPhotoFun,
    required this.removePhotoFun,
    required this.removeVideoFun,
    required this.addVideoFun}) : super(key: key);
  final List<TextEditingController> controllers;
  final Function() addPhotoFun;
  final Function() addVideoFun;
  final Function(int index) removePhotoFun;
  final Function(int index) removeVideoFun;
  final List<String> photosPaths;
  final List<String> videosPaths;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20, right: 20, top: 20, bottom: 90),
        child: Column(
          children: [
            ActivityWidgetTextField(
                hintText: 'أسم المكان',
                controller: controllers[0]),
            const ActivityWidgetTextField(
                isDate: true,
                hintText: 'التاريخ'),
            ActivityWidgetAddFileCard(
                addFun: addPhotoFun,
                removeFun: removePhotoFun,
                photosPaths: photosPaths,
                hintText: 'أضافة صور',
                iconData: Icons.add_a_photo),
            ActivityWidgetAddFileCard(
                hintText: 'أضافة الفيديوهات',
                addFun: addVideoFun,
                removeFun: removeVideoFun,
                videosPaths: videosPaths,
                iconData: Icons.video_library),
            ActivityWidgetTextField(
                hintText: 'الوصف',
                controller: controllers[1],
                height: MediaQuery.of(context).size.height * 1 / 4,
                maxLines: 9),
          ],
        ),
      ),
    );
  }
}
