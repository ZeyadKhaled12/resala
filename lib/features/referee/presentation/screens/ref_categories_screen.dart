import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resala/core/services/services_locator.dart';
import 'package:resala/core/utils/general_widgets/general_title_body_widget.dart';
import 'package:resala/core/utils/general_widgets/general_widget_circular_view.dart';
import 'package:resala/features/referee/domain/usecases/get_ref_categories_uc.dart';
import 'package:resala/features/referee/presentation/controller/ref_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../widgets/ref_categories_widgets/ref_category_widget.dart';

class RefCategoriesScreen extends StatelessWidget {
  const RefCategoriesScreen({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    return GeneralTitleBodyWidget(
        title: 'النشاطات',
        body: BlocProvider(
          create: (context) => sl<RefBloc>()
            ..add(GetRefCategoriesEvent(
                parameters: GetRefCategoriesParameters(token: token))),
          child: BlocBuilder<RefBloc, RefState>(builder: (context, state) {
            switch (state.refRequestState) {
              case RequestState.loading:
                return const GeneralWidgetCircularView();
              case RequestState.loaded:
                return Container(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: ListView.builder(
                      itemBuilder: (context, index) => RefCategoryWidget(
                          refCategory: state.refCategories[index], token: token),
                      itemCount: state.refCategories.length,
                    ));
              case RequestState.error:
                return const GeneralWidgetCircularView();
            }
          }),
        ));
  }
}
