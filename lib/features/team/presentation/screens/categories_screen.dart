
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/usecases/get_activities_uc.dart';
import '../../domain/usecases/get_categories_uc.dart';
import '../controller/team_bloc.dart';
import '../widgets/categories_widgets/categories_widget_body.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<TeamBloc>()..add(
        GetCategoriesEvent(parameters: GetCategoriesParameters(
          token: token)))..add(
        GetActivitiesEvent(parameters: GetActivitiesParameters(
          token: token))
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          child: AppBar(),
          preferredSize: const Size.fromHeight(0),
        ),
        body: BlocBuilder<TeamBloc,TeamState>(
          buildWhen: (previous, current) =>
          previous.teamRequestState != current.teamRequestState,
          builder: (context, state) {
            switch (state.teamRequestState) {
              case RequestState.loading:
                return const CategoriesWidgetBody(categories: [], activities: [], token: '');
              case RequestState.loaded:
                print('Loaded');
                print('${state.activities}');
                print('${state.categories}');
                return CategoriesWidgetBody(
                  activities: state.activities,
                  categories: state.categories,
                  token: token
                );
              case RequestState.error:
                return const CategoriesWidgetBody(categories: [],
                  activities: [], token: '');
            }
          }
        ),
      ),
    );
  }
}
