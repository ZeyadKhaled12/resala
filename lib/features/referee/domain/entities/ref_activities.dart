
import 'package:equatable/equatable.dart';

import '../../../team/domain/entities/activity.dart';

class RefActivities extends Equatable {

  final int count;
  final int next;
  final int previous;
  final List<Activity> refActivities;

  const RefActivities({
    required this.count,
    required this.next,
    required this.previous,
    required this.refActivities
  });

  @override
  List<Object> get props => [count, next, previous, refActivities];
}