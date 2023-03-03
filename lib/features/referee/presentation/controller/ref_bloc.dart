import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resala/features/team/domain/entities/activity.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/ref_category.dart';
import '../../domain/usecases/get_ref_activities_uc.dart';
import '../../domain/usecases/get_ref_categories_uc.dart';
import '../../domain/usecases/update_ref_activity_uc.dart';

part 'ref_event.dart';

part 'ref_state.dart';

class RefBloc extends Bloc<RefEvent, RefState> {
  final GetRefCategoriesUc getRefCategoriesUc;
  final GetRefActivitiesUc getRefActivitiesUc;
  final UpdateRefActivityUc updateRefActivityUc;

  RefBloc(this.getRefCategoriesUc, this.getRefActivitiesUc,
      this.updateRefActivityUc)
      : super(const RefState()) {
    on<GetRefCategoriesEvent>(_getRefCategories);
    on<GetRefActivitiesEvent>(_getRefActivities);
    on<UpdateRefActivityEvent>(_updateRefActivity);
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
      emit(state.copyWith(refRequestState: RequestState.loaded, activities: r));
    });
  }

  FutureOr<void> _updateRefActivity(
      UpdateRefActivityEvent event, Emitter<RefState> emit) async {
    final result = await updateRefActivityUc.call(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            refRequestState: RequestState.error, errorRefMessage: l.message)),
        (r) {});
  }
}
