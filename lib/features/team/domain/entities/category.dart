import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String imageUrl;
  final String pointsCalculation;
  final String terms;
  final int activitiesCount;
  final int totalScore;
  final String name;
  final String description;

  const Category(
      {required this.id,
      required this.imageUrl,
      required this.terms,
      required this.pointsCalculation,
      required this.name,
      required this.description,
      required this.activitiesCount,
      required this.totalScore});

  @override
  List<Object> get props => [
        id,
        imageUrl,
        pointsCalculation,
        terms,
        activitiesCount,
        totalScore,
        name,
        description,
      ];
}
