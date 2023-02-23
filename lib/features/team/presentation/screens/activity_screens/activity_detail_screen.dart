import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:resala/features/team/domain/usecases/update_activity_uc.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_constance.dart';
import '../../../../../core/utils/general_widgets/general_title_body_widget.dart';
import '../../../domain/entities/activity.dart';
import '../../controller/team_bloc.dart';
import '../../widgets/activity_widgets/activity_add_show_file_widgets/activity_widget_show_files.dart';
import '../../widgets/activity_widgets/activity_detail_widgets/activity_widget_status.dart';
import '../../widgets/activity_widgets/activity_detail_widgets/activity_widget_text_card.dart';

class ActivityDetailScreen extends StatelessWidget {
  const ActivityDetailScreen({Key? key, required this.activity,
    required this.token, required this.indexActivity})
      : super(key: key);
  final Activity activity;
  final String token;
  final int indexActivity;

  @override
  Widget build(BuildContext context) {
    return GeneralTitleBodyWidget(
        title: 'تفاصيل الحدث',
        body: BlocProvider(
          create: (ctx) => sl<TeamBloc>(),
          child: BlocBuilder<TeamBloc, TeamState>(
            builder: (context, state) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  children: [
                    ActivityWidgetStatus(
                        fun: () {
                          context.read<TeamBloc>().add(
                            UpdateActivityEvent(parameters: UpdateActivityParameters(
                              token: token,
                              activity: activity,
                              index: indexActivity
                            ))
                          );
                        },
                        status: activity.isFlag
                            ? AppConstance.flag
                            : activity.status,
                        points: activity.points),
                    ActivityWidgetTextCard(text: activity.location),
                    ActivityWidgetTextCard(
                        text: DateFormat('yyyy-MM-dd')
                            .format(DateTime.parse(activity.createdAt))),
                    ActivityWidgetShowFiles(photosPaths: activity.activityPhotos),
                    ActivityWidgetShowFiles(videosPaths: activity.activityVideos, isVideos: true),
                    ActivityWidgetTextCard(text: activity.description),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
