import 'package:dartz/dartz.dart';
import 'package:resala/core/usecase/base_use_case.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/login.dart';
import '../../domain/repository/base_login_repo.dart';
import '../../domain/usecases/login_uc.dart';
import '../datasource/login_remote_data_source.dart';

class LoginRepo extends BaseLoginRepo{

  BaseLoginRemoteDataSource baseLoginRemoteDataSource;
  LoginRepo(this.baseLoginRemoteDataSource);


  @override
  Future<Either<Failure, Login>> login(LoginParameters parameters) async{
    final result = await baseLoginRemoteDataSource.login(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage[0]));
    }
  }

  @override
  Future captureToken(Login parameters) async{
    await baseLoginRemoteDataSource.captureToken(parameters);
  }

  @override
  Future<Login> checkIfLoginBefore(NoParameters parameters) async{
    return await baseLoginRemoteDataSource.checkIfLoginBefore(parameters);
  }

  @override
  Future<NoParameters> logout(NoParameters parameters) async{
    return await baseLoginRemoteDataSource.logout(parameters);
  }


}