import 'package:equatable/equatable.dart';


class Login extends Equatable {
  final String userName;
  final bool isTeam;
  final bool isReferee;
  final String token;
  final String name;
  final String activityName;
  final String brunch;
  final List<String> members;
  final List<String> leaders;
  final String image;

  const Login({
    required this.userName,
    required this.isTeam,
    required this.isReferee,
    required this.token,
    required this.name,
    required this.activityName,
    required this.brunch,
    required this.members,
    required this.leaders,
    required this.image,
  });

  @override
  List<Object> get props =>
      [
        userName,
        isTeam,
        isReferee,
        token,
        name,
        activityName,
        brunch,
        members,
        leaders,
        image,
      ];
}