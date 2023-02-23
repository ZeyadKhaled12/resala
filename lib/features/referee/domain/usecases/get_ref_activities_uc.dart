import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:resala/core/utils/enums.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/ref_activities.dart';
import '../repository/base_ref_repo.dart';

class GetRefActivitiesUc
    extends BaseUseCase<RefActivities, GetRefActivitiesParameters> {
  final BaseRefRepo baseRefRepo;

  GetRefActivitiesUc(this.baseRefRepo);

  @override
  Future<Either<Failure, RefActivities>> call(
      GetRefActivitiesParameters parameters) async {
    return await baseRefRepo.getRefActivities(parameters);
  }
}

class GetRefActivitiesParameters extends Equatable {
  final int categoryId;
  final int page;
  final String token;
  final Status status;

  const GetRefActivitiesParameters(
      {required this.categoryId, required this.page, required this.token, required this.status});

  @override
  List<Object> get props => [categoryId, page];
}
