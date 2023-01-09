import 'package:get_it/get_it.dart';
import '../../features/login/data/datasource/login_remote_data_source.dart';
import '../../features/login/data/repository/login_repo.dart';
import '../../features/login/domain/repository/base_login_repo.dart';
import '../../features/login/domain/usecases/login_uc.dart';
import '../../features/login/presentation/controller/login_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator{
  void init(){

    //Bloc
    sl.registerFactory(() => LoginBloc(sl()));


    //Use Case
    sl.registerLazySingleton(() =>
        LoginUc(sl()));


    //Repo
    sl.registerLazySingleton<BaseLoginRepo>(() =>
        LoginRepo(sl()));


    //Data Source
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(() =>
        LoginRemoteDataSource());

  }

}