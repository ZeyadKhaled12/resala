part of 'ref_bloc.dart';

class RefState extends Equatable {
  final List<RefCategory> refCategories;
  final List<Activity> activities;
  final RequestState refRequestState;
  final String errorRefMessage;

  const RefState(
      {this.refCategories = const [],
      this.activities = const [],
      this.refRequestState = RequestState.loading,
      this.errorRefMessage = ''});

  RefState copyWith(
      {List<RefCategory>? refCategories,
      List<Activity>? activities,
      RequestState? refRequestState,
      String? errorRefMessage}) {
    return RefState(
      refCategories: refCategories ?? this.refCategories,
      activities: activities ?? this.activities,
      refRequestState: refRequestState ?? this.refRequestState,
      errorRefMessage: errorRefMessage ?? this.errorRefMessage,
    );
  }

  @override
  List<Object> get props => [
        refCategories,
        activities,
        refRequestState,
        errorRefMessage,
      ];
}
