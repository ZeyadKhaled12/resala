import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resala/core/utils/app_constance.dart';
import 'package:resala/features/referee/domain/entities/ref_activities.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/ref_category.dart';
import '../../domain/usecases/get_ref_activities_uc.dart';
import '../../domain/usecases/get_ref_categories_uc.dart';

part 'ref_event.dart';

part 'ref_state.dart';

class RefBloc extends Bloc<RefEvent, RefState> {
  final GetRefCategoriesUc getRefCategoriesUc;
  final GetRefActivitiesUc getRefActivitiesUc;

  RefBloc(this.getRefCategoriesUc, this.getRefActivitiesUc)
      : super(const RefState()) {
    on<GetRefCategoriesEvent>(_getRefCategories);
    on<GetRefActivitiesEvent>(_getRefActivities);
  }

  FutureOr<void> _getRefCategories(
      GetRefCategoriesEvent event, Emitter<RefState> emit) async {
    final result = await getRefCategoriesUc.call(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            refRequestState: RequestState.error, errorRefMessage: l.message)),
        (r) => emit(state.copyWith(
            refRequestState: RequestState.loaded, refCategories: r)));
  }

  FutureOr<void> _getRefActivities(
      GetRefActivitiesEvent event, Emitter<RefState> emit) async {
    final result = await getRefActivitiesUc.call(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            refRequestState: RequestState.error,
            errorRefMessage: l.message)), (r) {
      switch (event.parameters.status) {
        case Status.accepted:
          emit(state.copyWith(
              refRequestState: RequestState.loaded, refAccActivities: r));
          break;
        case Status.rejected:
          emit(state.copyWith(
              refRequestState: RequestState.loaded, refRejActivities: r));
          break;
        case Status.pending:
          emit(state.copyWith(
              refRequestState: RequestState.loaded, refPendActivities: r));
          break;
        case Status.flag:
          emit(state.copyWith(
              refRequestState: RequestState.loaded, refObjActivities: r));
          break;
      }
    });
  }
}
