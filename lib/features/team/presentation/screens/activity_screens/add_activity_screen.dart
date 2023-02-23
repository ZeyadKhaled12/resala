import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/general_widgets/general_title_body_widget.dart';
import '../../../../../core/utils/general_widgets/general_widget_circular_view.dart';
import '../../../../../core/utils/general_widgets/general_widget_show_error_message.dart';
import '../../../domain/usecases/add_activity_uc.dart';
import '../../../domain/usecases/chose_photos_paths_uc.dart';
import '../../../domain/usecases/chose_videos_paths_uc.dart';
import '../../../domain/usecases/remove_photo_path_uc.dart';
import '../../../domain/usecases/remove_video_path_uc.dart';
import '../../controller/team_bloc.dart';
import '../../widgets/activity_widgets/add_activity_widgets/activity_widget_add_button.dart';
import '../../widgets/activity_widgets/add_activity_widgets/add_activity_widget_body.dart';

class AddActivityScreen extends StatelessWidget {
  AddActivityScreen(
      {Key? key,
      required this.token,
      required this.categoryId,
      required this.activitiesLength})
      : super(key: key);
  final String token;
  final int activitiesLength;
  final int categoryId;
  final List<TextEditingController> _controllers =
      List.generate(2, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TeamBloc>(),
      child: GeneralTitleBodyWidget(
        title: 'أضافة حدث',
        body: BlocBuilder<TeamBloc, TeamState>(
          buildWhen: (previous, current) =>
              previous.teamRequestState != current.teamRequestState,
          builder: (context, state) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AddActivityWidgetBody(
                  removePhotoFun: (index) => context.read<TeamBloc>().add(
                      RemovePhotoPathEvent(
                          parameters: RemovePhotoPathParameters(index: index))),
                  removeVideoFun: (index) => context.read<TeamBloc>().add(
                      RemoveVideoPathEvent(
                          parameters: RemoveVideoPathParameters(index: index))),
                  photosPaths:
                      context.watch<TeamBloc>().state.chosenPhotosPaths,
                  videosPaths:
                      context.watch<TeamBloc>().state.chosenVideosPaths,
                  controllers: _controllers,
                  addPhotoFun: () async {
                    PickedFile? image = await ImagePicker()
                        .getImage(source: ImageSource.gallery);
                    context.read<TeamBloc>().add(ChosePhotosPathsEvent(
                        parameters: ChosePhotosPathsParameters(
                            photosPaths: state.chosenPhotosPaths,
                            path: image!.path)));
                  },
                  addVideoFun: () async {
                    PickedFile? video = await ImagePicker()
                        .getVideo(source: ImageSource.gallery);
                    if ((File(video!.path).lengthSync() / 1000000).ceil() <= 50) {
                      context.read<TeamBloc>().add(ChoseVideosPathsEvent(
                          parameters: ChoseVideosPathsParameters(
                              videosPaths: state.chosenVideosPaths,
                              path: video.path)));
                    }else{
                      generalWidgetShowErrorMessage(context, 'المقطع تخطي الحد المسموح(10 mega byte)');
                    }
                  },
                ),
                ActivityWidgetAddButton(fun: () {
                  if (_controllers[0].text.isEmpty) {
                    generalWidgetShowErrorMessage(context, 'اسم المكان مطلوب');
                  } else if (state.date.isEmpty) {
                    generalWidgetShowErrorMessage(context, 'التاريخ مطلوب');
                  } else if (_controllers[1].text.isEmpty) {
                    generalWidgetShowErrorMessage(context, 'الوصف مطلوب');
                  } else if (BlocProvider.of<TeamBloc>(context, listen: false)
                          .state
                          .chosenPhotosPaths
                          .isEmpty &&
                      BlocProvider.of<TeamBloc>(context, listen: false)
                          .state
                          .chosenVideosPaths
                          .isEmpty) {
                    generalWidgetShowErrorMessage(
                        context, 'مطلوب صورة واحدة او فيديو واحد علي الاقل');
                  } else {
                    context.read<TeamBloc>().add(AddActivityEvent(
                        parameters: AddActivityParameters(
                            photosPaths: state.chosenPhotosPaths,
                            length: activitiesLength + 1,
                            categoryId: categoryId,
                            videosPath: state.chosenVideosPaths,
                            locationName: _controllers[0].text,
                            date: state.date,
                            description: _controllers[1].text,
                            token: token)));
                  }
                }),
                if (context.watch<TeamBloc>().state.teamRequestState ==
                    RequestState.loading)
                  const GeneralWidgetCircularView()
              ],
            );
          },
        ),
      ),
    );
  }
}
