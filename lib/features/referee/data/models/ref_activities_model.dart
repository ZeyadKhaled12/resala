import 'dart:convert';
import '../../../team/data/models/activity_model.dart';
import '../../../team/domain/entities/activity.dart';
import '../../domain/entities/ref_activities.dart';

class RefActivitiesModel extends RefActivities {
  const RefActivitiesModel(
      {required int count,
      required int next,
      required int previous,
      required List<Activity> refActivities})
      : super(
            count: count,
            next: next,
            previous: previous,
            refActivities: refActivities);

  factory RefActivitiesModel.fromJson(Map<String, dynamic> json) =>
      RefActivitiesModel(
        count: json['count'],
        next: json['next']?? 0,
        previous: json['previous']?? 0,
        refActivities: List<ActivityModel>.from(
            (json['results'] as List)
                .map((e) => ActivityModel.fromJson(e))),
      );
}
