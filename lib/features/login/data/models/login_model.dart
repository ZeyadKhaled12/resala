import '../../domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel(
      {required String userName,
      required bool isTeam,
      required bool isReferee,
      required String token})
      : super(
            userName: userName,
            isTeam: isTeam,
            isReferee: isReferee,
            token: token);

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      userName: json['username'],
      isTeam: json['is_team'],
      isReferee: json['is_referee'],
      token: json['token']);
}
