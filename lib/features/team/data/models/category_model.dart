import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel(
      {required int id,
      required String name,
        required String imageUrl,
        required String pointsCalculation,
        required String terms,
      required String description,
      required int activitiesCount,
      required int totalScore})
      : super(
            id: id,
            imageUrl: imageUrl,
            pointsCalculation: pointsCalculation,
            terms: terms,
            name: name,
            description: description,
            activitiesCount: activitiesCount,
            totalScore: totalScore);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
      id: json['id'],
      pointsCalculation: json['point_calculation'],
      imageUrl: json['image'],
      terms: json['terms'],
      name: json['name'],
      description: json['description'],
      activitiesCount: json['activities_count'],
      totalScore: json['total_score']);
}
