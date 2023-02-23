import 'dart:convert';
import '../../../../core/error/exception.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/utils/app_constance.dart';
import '../../domain/usecases/get_ref_activities_uc.dart';
import '../../domain/usecases/get_ref_categories_uc.dart';
import 'package:http/http.dart' as http;

import '../models/ref_activities_model.dart';
import '../models/ref_category_model.dart';

abstract class BaseRefRemoteDataSource {
  Future<List<RefCategoryModel>> getRefCategories(
      GetRefCategoriesParameters parameters);

  Future<RefActivitiesModel> getRefActivities(
      GetRefActivitiesParameters parameters);
}

class RefRemoteDataSource extends BaseRefRemoteDataSource {
  @override
  Future<List<RefCategoryModel>> getRefCategories(
      GetRefCategoriesParameters parameters) async {
    final response = await http.get(
      Uri.parse(AppConstance.getRefCategoriesUrl),
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
      return List<RefCategoryModel>.from(
          (res as List).map((e) => RefCategoryModel.fromJson(e)));
    } else {
      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }

  @override
  Future<RefActivitiesModel> getRefActivities(
      GetRefActivitiesParameters parameters) async {
    final response = await http.get(
      Uri.parse(AppConstance.getRefActivitiesUrl(
          parameters.categoryId, parameters.page, parameters.status)),
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
      for (var element in RefActivitiesModel.fromJson(res).refActivities) {
        print('\n$element');
      }
      return RefActivitiesModel.fromJson(res);
    } else {
      print(jsonDecode(response.body));
      throw ServerException(
          ErrorMessageModel.fromJson(jsonDecode(response.body)));
    }
  }
}
