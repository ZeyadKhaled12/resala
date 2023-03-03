import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../../../core/utils/app_constance.dart';
import '../../domain/entities/login.dart';
import '../../domain/usecases/login_uc.dart';
import '../models/login_model.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseLoginRemoteDataSource {
  Future<LoginModel> login(LoginParameters parameters);

  Future captureToken(Login parameters);

  Future<Login> checkIfLoginBefore(NoParameters parameters);

  Future<NoParameters> logout(NoParameters parameters);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  @override
  Future<LoginModel> login(LoginParameters parameters) async {
    UserModel _user =
        UserModel(userName: parameters.userName, password: parameters.password);
    final response = await http.post(Uri.parse(AppConstance.loginUrl),
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(_user.toJson()));
    if (response.statusCode == 200) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }

  @override
  Future captureToken(Login parameters) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(AppConstance.sharedPrefIsLoginBefore, true);
    await sharedPreferences.setString(
        AppConstance.sharedPrefUsername, parameters.userName);
    await sharedPreferences.setBool(
        AppConstance.sharedPrefIsTeam, parameters.isTeam);
    await sharedPreferences.setBool(
        AppConstance.sharedPrefIsReferee, parameters.isReferee);
    await sharedPreferences.setString(
        AppConstance.sharedPrefToken, parameters.token);
    await sharedPreferences.setString(
        AppConstance.sharedPrefBrunch, parameters.brunch);
    await sharedPreferences.setStringList(
        AppConstance.sharedPrefIActivityLeaders, parameters.leaders);
    await sharedPreferences.setStringList(
        AppConstance.sharedPrefIActivityMembers, parameters.members);
    await sharedPreferences.setString(
        AppConstance.sharedPrefImage, parameters.image);
    await sharedPreferences.setString(
        AppConstance.sharedPrefIActivityName, parameters.activityName);
    await sharedPreferences.setString(
        AppConstance.sharedPrefName, parameters.name);
  }

  @override
  Future<Login> checkIfLoginBefore(NoParameters parameters) async {
    Login loginConst = const Login(
        userName: '',
        isTeam: false,
        isReferee: false,
        token: '',
        members: [],
        leaders: [],
        brunch: '',
        activityName: '',
        name: '',
        image: '');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLoginBefore =
        sharedPreferences.getBool(AppConstance.sharedPrefIsLoginBefore);
    if (isLoginBefore != null) {
      if (isLoginBefore) {
        return Login(
          userName:
              sharedPreferences.getString(AppConstance.sharedPrefUsername)!,
          isTeam: sharedPreferences.getBool(AppConstance.sharedPrefIsTeam)!,
          isReferee:
              sharedPreferences.getBool(AppConstance.sharedPrefIsReferee)!,
          token: sharedPreferences.getString(AppConstance.sharedPrefToken)!,
          image: sharedPreferences.getString(AppConstance.sharedPrefImage)!,
          name: sharedPreferences.getString(AppConstance.sharedPrefName)!,
          activityName: sharedPreferences
              .getString(AppConstance.sharedPrefIActivityName)!,
          brunch: sharedPreferences.getString(AppConstance.sharedPrefBrunch)!,
          leaders: sharedPreferences
              .getStringList(AppConstance.sharedPrefIActivityLeaders)!,
          members: sharedPreferences
              .getStringList(AppConstance.sharedPrefIActivityMembers)!,
        );
      } else {
        return loginConst;
      }
    } else {
      return loginConst;
    }
  }

  @override
  Future<NoParameters> logout(NoParameters parameters) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(
        AppConstance.sharedPrefIsLoginBefore, false);
    return const NoParameters();
  }
}
