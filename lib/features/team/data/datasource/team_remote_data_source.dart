import 'dart:convert';
import 'dart:io';
import '../../../../core/error/exception.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/utils/app_constance.dart';
import 'package:http/http.dart' as http;
import '../../domain/usecases/add_activity_uc.dart';
import '../../domain/usecases/get_activities_uc.dart';
import '../../domain/usecases/get_categories_uc.dart';
import '../../domain/usecases/update_activity_uc.dart';
import '../models/activity_model.dart';
import '../models/add_activity_model.dart';
import '../models/category_model.dart';

abstract class BaseTeamRemoteDataSource {
  Future<List<CategoryModel>> getCategories(GetCategoriesParameters parameters);
  Future<List<ActivityModel>> getActivities(GetActivitiesParameters parameters);
  Future<ActivityModel> addActivity(AddActivityParameters parameters);
  Future<ActivityModel> updateActivity(UpdateActivityParameters parameters);
}

class TeamRemoteDataSource extends BaseTeamRemoteDataSource {

  @override
  Future<List<CategoryModel>> getCategories(
      GetCategoriesParameters parameters) async {
    final response = await http.get(
      Uri.parse(AppConstance.categoriesUrl),
      headers: {
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
        'Accept': 'application/json',
        'Authorization': 'Token ${parameters.token}',
      },
    );
    if (response.statusCode == 200) {
      var myDataString = utf8.decode(response.bodyBytes);
      var res = jsonDecode(myDataString);
      return List<CategoryModel>.from((res as List)
          .map((e) => CategoryModel.fromJson(e)));
    } else {
      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }

  @override
  Future<List<ActivityModel>> getActivities(
      GetActivitiesParameters parameters) async {
    final response = await http.get(
      Uri.parse(AppConstance.activitiesUrl),
      headers: {
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
        'Accept': 'application/json',
        'Authorization': 'Token ${parameters.token}',
      },
    );
    if (response.statusCode == 200) {
      var myDataString = utf8.decode(response.bodyBytes);
      var res = jsonDecode(myDataString);
      return List<ActivityModel>.from((res as List)
          .map((e) => ActivityModel.fromJson(e)));
    } else {
      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }

  @override
  Future<ActivityModel> addActivity(AddActivityParameters parameters) async {
    List<String> photosPathByt = [];
    List<String> videosPathByt = [];
    for (var element in parameters.photosPaths) {
      await File(element)
          .readAsBytes()
          .then((value) => photosPathByt.add(jsonEncode(value)));
    }
    for (var element in parameters.videosPath) {
      await File(element)
          .readAsBytes()
          .then((value) => videosPathByt.add(jsonEncode(value)));
    }
    final AddActivityModel activity = AddActivityModel(
        categoryId: parameters.categoryId,
        name: 'Activity ${parameters.length}',
        location: parameters.locationName,
        description: parameters.description,
        isFlag: false,
        activityPhotos: photosPathByt,
        activityVideos: videosPathByt);

    final response = await http.post(
        Uri.parse(AppConstance.addActivityUrl),
        headers: {
          'Content-Type':
              'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW',
          'Charset': 'utf-8',
          'Accept': 'application/json',
          'Authorization': 'Token ${parameters.token}',
        },
        body: jsonEncode(activity.toJson()));
    if (response.statusCode == 200) {
      var myDataString = utf8.decode(response.bodyBytes);
      var res = jsonDecode(myDataString);
      return ActivityModel.fromJson(res);
    } else {

      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }

  @override
  Future<ActivityModel> updateActivity(UpdateActivityParameters parameters) async{
    ActivityModel activity = ActivityModel(
        id: parameters.activity.id,
        user: parameters.activity.id,
        updatedAt: parameters.activity.updatedAt,
        createdAt: parameters.activity.createdAt,
        categoryId: parameters.activity.categoryId,
        name: parameters.activity.name,
        points: parameters.activity.id,
        status: parameters.activity.status,
        isFlag: parameters.isFlagUpdated?true:parameters.activity.isFlag,
        location: parameters.activity.location,
        description: parameters.activity.description,
        activityPhotos: parameters.activity.activityPhotos,
        activityVideos: parameters.activity.activityVideos);
    final response = await http.put(
        Uri.parse(AppConstance.updateActivityUrl(activity.id)),
        headers: {
          'Content-Type':
          'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW',
          'Charset': 'utf-8',
          'Accept': 'application/json',
          'Authorization': 'Token ${parameters.token}',
        },
        body: jsonEncode(activity.toJson()));
    if (response.statusCode == 200) {
      var myDataString = utf8.decode(response.bodyBytes);
      var res = jsonDecode(myDataString);
      return ActivityModel.fromJson(res);
    }
    else {

      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }

}
