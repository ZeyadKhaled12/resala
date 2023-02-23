/*
import 'package:flutter/material.dart';

import '../../../../domain/entities/file.dart';
import '../../../screens/activity_screens/activity_show_file_screen.dart';

class ActivityWidgetPhotosCard extends StatelessWidget {
  const ActivityWidgetPhotosCard({Key? key, required this.photos}) : super(key: key);
  final List<File> photos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1/2.5,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10)),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (_, index) => InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return ActivityShowFileScreen(filePath: photos[index].file, isVideo: false, isShowAct: false);
                }));
              },
              child: Container(
                  height: 90,
                  width: 90,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      border: Border.all(color: Colors.white, width: 8),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image(fit: BoxFit.cover, image: NetworkImage(photos[index].file))),
            ),
            itemCount: photos.length,
          )
      ),
    );
  }
}

 */
