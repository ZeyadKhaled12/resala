
import 'package:flutter/material.dart';
import 'package:resala/core/utils/assets_manager.dart';

class GeneralWidgetCircularView extends StatelessWidget {
  const GeneralWidgetCircularView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white.withOpacity(0.8),
      child: Stack(
        alignment: Alignment.center,
        children: const [
          SizedBox(
              width: 120,
              height: 120,
              child: CircularProgressIndicator(
                backgroundColor: Color(0XFFE32327),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0XFF293781)),
              )),
          Image(image: AssetImage(ImagesAssets.resalaLogo),
            height: 40,
          ),
        ],
      ),
    );
  }
}
