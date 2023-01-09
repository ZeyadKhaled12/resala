import 'dart:convert';
import '../../../../core/error/exception.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/utils/app_constance.dart';
import '../../domain/usecases/login_uc.dart';
import '../models/login_model.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as  http;

abstract class BaseLoginRemoteDataSource {
  Future<LoginModel> login(LoginParameters parameters);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {

  @override
  Future<LoginModel> login(LoginParameters parameters) async {
    UserModel _user =
        UserModel(userName: parameters.userName, password: parameters.password);
    final response = await http.post(
        Uri.parse(AppConstance.loginUrl),
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(_user.toJson())
    );
    if (response.statusCode == 200) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }
}
