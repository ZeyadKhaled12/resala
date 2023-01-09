import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/login.dart';
import '../usecases/login_uc.dart';

abstract class BaseLoginRepo{
  Future<Either<Failure, Login>> login(LoginParameters parameters);
}