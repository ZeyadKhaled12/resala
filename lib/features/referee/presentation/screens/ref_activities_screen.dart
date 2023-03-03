import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resala/core/services/services_locator.dart';
import 'package:resala/core/utils/app_constance.dart';
import 'package:resala/features/referee/domain/entities/update_ref_activity.dart';
import 'package:resala/features/referee/domain/usecases/update_ref_activity_uc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/general_widgets/general_widget_circular_view.dart';
import '../../../team/domain/entities/activity.dart';
import '../../../team/presentation/screens/activity_screens/activity_detail_screen.dart';
import '../../../team/presentation/widgets/category_widgets/category_widget_card.dart';
import '../../domain/usecases/get_ref_activities_uc.dart';
import '../controller/ref_bloc.dart';

class RefActivitiesScreen extends StatelessWidget {
  const RefActivitiesScreen(
      {Key? key, required this.getRefActivitiesParameters})
      : super(key: key);
  final GetRefActivitiesParameters getRefActivitiesParameters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: BlocProvider(
            create: (context) => sl<RefBloc>()
              ..add(GetRefActivitiesEvent(
                  parameters: getRefActivitiesParameters)),
            child: BlocBuilder<RefBloc, RefState>(
              builder: (context, state) {
                switch (state.refRequestState) {
                  case RequestState.loading:
                    return const GeneralWidgetCircularView();
                  case RequestState.loaded:
                    return activityCard(context, state.activities,
                        getRefActivitiesParameters.token);
                  case RequestState.error:
                    return const Center(child: Text('Error'));
                }
              },
            )),
      ),
    );
  }
}

Widget activityCard(
        BuildContext contextBloc, List<Activity> activities, String token) =>
    ListView.builder(
        itemBuilder: (ctx, index) {
          return CategoryWidgetCard(
              statusActivity: activities[index].status,
              isFlag: activities[index].isFlag,
              points: activities[index].points,
              isPhotos: activities[index].activityPhotos.isNotEmpty,
              isVideos: activities[index].activityVideos.isNotEmpty,
              name: activities[index].name,
              fun: () => Navigator.push(
                  contextBloc,
                  MaterialPageRoute(
                      builder: (context) => ActivityDetailScreen(
                          refuseFun: () {
                            contextBloc.read<RefBloc>().add(
                                UpdateRefActivityEvent(
                                    parameters: UpdateRefActivityParameters(
                                        token: token,
                                        activityId: activities[index].id,
                                        updateRefActivity:
                                            const UpdateRefActivity(
                                                isObjected: false,
                                                status: AppConstance.rejected,
                                                score: 0))));
                          },
                          acceptFun: (score) => contextBloc.read<RefBloc>().add(
                              UpdateRefActivityEvent(
                                  parameters: UpdateRefActivityParameters(
                                      token: token,
                                      activityId: activities[index].id,
                                      updateRefActivity: UpdateRefActivity(
                                          isObjected: false,
                                          status: AppConstance.accept,
                                          score: score)))),
                          refuseFlagFun: (){
                            contextBloc.read<RefBloc>().add(
                                UpdateRefActivityEvent(
                                    parameters: UpdateRefActivityParameters(
                                        token: token,
                                        activityId: activities[index].id,
                                        updateRefActivity:
                                        UpdateRefActivity(
                                            isObjected: false,
                                            status: activities[index].status,
                                            score: activities[index].points))));
                          },
                          activity: activities[index],
                          isRef: true,
                          indexActivity: index,
                          token: token //token,
                          ))));
        },
        itemCount: activities.length);
