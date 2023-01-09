import 'package:dartz/dartz.dart';
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


}