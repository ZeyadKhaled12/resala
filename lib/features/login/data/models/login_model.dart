import '../../domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel(
      {required String userName,
      required bool isTeam,
      required bool isReferee,
      required String token,
      required String name,
      required String activityName,
      required String brunch,
      required List<String> members,
      required List<String> leaders,
      required String image})
      : super(
            userName: userName,
            isTeam: isTeam,
            isReferee: isReferee,
            token: token,
            name: name,
            activityName: activityName,
            brunch: brunch,
            members: members,
            leaders: leaders,
            image: image);

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      userName: json['username'],
      isTeam: json['is_team'],
      isReferee: json['is_referee'],
      token: json['token'],
      image: json['image'] ?? '',
      name: json['name'],
      activityName: json['activity_name'],
      brunch: json['branch'],
      leaders: List<String>.from(json['leaders'] as List),
      members:  List<String>.from(json['members'] as List)
  );
}
