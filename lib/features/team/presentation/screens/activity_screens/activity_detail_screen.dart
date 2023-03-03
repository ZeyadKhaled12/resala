
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:resala/core/utils/assets_manager.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_constance.dart';
import '../../../../../core/utils/general_widgets/general_title_body_widget.dart';
import '../../../domain/entities/activity.dart';
import '../../../domain/usecases/update_activity_uc.dart';
import '../../controller/team_bloc.dart';
import '../../widgets/activity_widgets/activity_add_show_file_widgets/activity_widget_show_files.dart';
import '../../widgets/activity_widgets/activity_detail_widgets/activity_widget_status.dart';
import '../../widgets/activity_widgets/activity_detail_widgets/activity_widget_text_card.dart';

class ActivityDetailScreen extends StatelessWidget {
  const ActivityDetailScreen(
      {Key? key,
      required this.activity,
      required this.token,
      required this.indexActivity,
      required this.isRef, this.refuseFun, this.acceptFun, this.refuseFlagFun})
      : super(key: key);
  final Activity activity;
  final String token;
  final int indexActivity;
  final bool isRef;
  final Function()? refuseFun;
  final Function(int score)? acceptFun;
  final Function()? refuseFlagFun;

  @override
  Widget build(BuildContext context) {
    final TextEditingController score = TextEditingController();
    return GeneralTitleBodyWidget(
        title: 'تفاصيل الحدث',
        body: BlocProvider(
          create: (ctx) => sl<TeamBloc>(),
          child: BlocBuilder<TeamBloc, TeamState>(
            builder: (context, state) => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        children: [
                          ActivityWidgetStatus(
                              fun: () {
                                context.read<TeamBloc>().add(UpdateActivityEvent(
                                    parameters: UpdateActivityParameters(
                                        token: token,
                                        activity: activity,
                                        index: indexActivity)));
                              },
                              status: activity.isFlag
                                  ? AppConstance.flag
                                  : activity.status,
                              points: activity.points),
                          ActivityWidgetTextCard(text: activity.location),
                          ActivityWidgetTextCard(
                              text: DateFormat('yyyy-MM-dd')
                                  .format(DateTime.parse(activity.createdAt))),
                          ActivityWidgetShowFiles(
                              photosPaths: activity.activityPhotos),
                          ActivityWidgetShowFiles(
                              videosPaths: activity.activityVideos,
                              isVideos: true),
                          ActivityWidgetTextCard(text: activity.description),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isRef && (activity.status == AppConstance.pending || activity.status == AppConstance.flag))
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Theme.of(context).backgroundColor,
                            width: 4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: (){
                                if(activity.status == AppConstance.flag) {
                                  refuseFlagFun!();
                                }else{
                                  refuseFun!();
                                }
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'رفض',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: FontAssets.arabicTitleFont),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red)),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 10)),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () async{
                                await showDialog(context: context, builder:
                                   (BuildContext context) => AlertDialog(
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                     title: const Text('اضف نقاط لهذا النشاط', style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 25,
                                       fontWeight: FontWeight.w800,
                                       fontFamily: FontAssets.sansFont
                                     )),
                                     content: Column(
                                       mainAxisSize: MainAxisSize.min,
                                       children: [
                                         TextField(
                                           textAlign: TextAlign.center,
                                           controller: score,
                                           style: const TextStyle(
                                             color: Colors.black,
                                             fontSize: 24
                                           ),
                                           cursorColor: Colors.black,
                                           decoration: const InputDecoration(
                                             fillColor: Colors.black
                                           ),
                                           keyboardType: TextInputType.number,
                                           inputFormatters: <TextInputFormatter>[
                                             FilteringTextInputFormatter.digitsOnly
                                           ], // Only num
                                         ),
                                         TextButton(onPressed: (){
                                           acceptFun!(int.parse(score.text));
                                           Navigator.pop(context);
                                           Navigator.pop(context);
                                         }, child: const Text('ارسال', style: TextStyle(
                                           color: Colors.green,
                                           fontSize: 24,
                                           fontWeight: FontWeight.bold
                                         ),))
                                       ],
                                     ),
                                   )
                                );
                              },
                              child: const Text(
                                'قبول',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: FontAssets.arabicTitleFont),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green)),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ));
  }
}
