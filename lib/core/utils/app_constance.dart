import 'package:resala/core/utils/enums.dart';

class AppConstance {
  static const sharedPrefUsername = 'user_name';
  static const sharedPrefIsTeam = 'is_team';
  static const sharedPrefIsReferee = 'is_referee';
  static const sharedPrefToken = 'token';
  static const sharedPrefIsLoginBefore = 'is_login_before';

  static const accept = 'accepted';
  static const rejected = 'rejected';
  static const pending = 'pending';
  static const flag = 'flag';

  static const baseUrl = 'http://resala-competitions.herokuapp.com';
  static const loginUrl = '$baseUrl/api/account/login';
  static const categoriesUrl = '$baseUrl/api/competition/category/team/list';
  static const activitiesUrl = '$baseUrl/api/activity/get-team-activities';
  static const addActivityUrl = '$baseUrl/api/activity/';
  static const getRefCategoriesUrl =
      '$baseUrl/api/competition/category/referee/list';


  static getRefActivitiesUrl(int categoryId, int page, Status status) =>
      '$baseUrl/api/competition/category/referee/activities/list/$categoryId?page=$page&status=$status';

  static updateActivityUrl(int id) => '$baseUrl/api/activity/edit/$id';
}
