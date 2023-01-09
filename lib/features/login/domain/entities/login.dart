import 'package:equatable/equatable.dart';


class Login extends Equatable {
  final String userName;
  final bool isTeam;
  final bool isReferee;
  final String token;

  const Login({required this.userName, required this.isTeam,
    required this.isReferee, required this.token});

  @override
  List<Object> get props => [userName, isTeam, isReferee, token];
}