part of 'ref_bloc.dart';

class RefState extends Equatable {
  final List<RefCategory> refCategories;
  final RefActivities refAccActivities;
  final RefActivities refPendActivities;
  final RefActivities refObjActivities;
  final RefActivities refRejActivities;

  final RequestState refRequestState;
  final String errorRefMessage;

  const RefState({this.refCategories = const [],
    this.refAccActivities = const RefActivities(
        count: 0, next: 0, previous: 0, refActivities: []),
    this.refPendActivities = const RefActivities(
        count: 0, next: 0, previous: 0, refActivities: []),
    this.refObjActivities = const RefActivities(
        count: 0, next: 0, previous: 0, refActivities: []),
    this.refRejActivities = const RefActivities(
        count: 0, next: 0, previous: 0, refActivities: []),
    this.refRequestState = RequestState.loading,
    this.errorRefMessage = ''});

  RefState copyWith({List<RefCategory>? refCategories,
    RefActivities? refAccActivities,
    RefActivities? refPendActivities,
    RefActivities? refObjActivities,
    RefActivities? refRejActivities,
    RequestState? refRequestState,
    String? errorRefMessage}) {
    return RefState(
      refCategories: refCategories ?? this.refCategories,
      refAccActivities: refAccActivities ?? this.refAccActivities,
      refPendActivities: refPendActivities ?? this.refPendActivities,
      refRejActivities: refRejActivities ?? this.refRejActivities,
      refObjActivities: refObjActivities ?? this.refObjActivities,
      refRequestState: refRequestState ?? this.refRequestState,
      errorRefMessage: errorRefMessage ?? this.errorRefMessage,
    );
  }

  @override
  List<Object> get props =>
      [
        refCategories,
        refAccActivities,
        refPendActivities,
        refObjActivities,
        refRejActivities,
        refRequestState,
        errorRefMessage,
      ];
}
