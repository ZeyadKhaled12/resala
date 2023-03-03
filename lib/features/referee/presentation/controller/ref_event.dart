part of 'ref_bloc.dart';

abstract class RefEvent extends Equatable {
  const RefEvent();

  @override
  List<Object> get props => [];
}

class GetRefCategoriesEvent extends RefEvent {
  final GetRefCategoriesParameters parameters;

  const GetRefCategoriesEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}

class GetRefActivitiesEvent extends RefEvent {
  final GetRefActivitiesParameters parameters;

  const GetRefActivitiesEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}

class UpdateRefActivityEvent extends RefEvent {
  final UpdateRefActivityParameters parameters;

  const UpdateRefActivityEvent({required this.parameters});

  @override
  List<Object> get props => [parameters];
}
