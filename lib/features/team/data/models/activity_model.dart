
import '../../domain/entities/activity.dart';
import '../../domain/entities/file.dart';
import 'file_model.dart';

class ActivityModel extends Activity {
  const ActivityModel(
      {required int id,
      required int user,
      required String updatedAt,
      required String createdAt,
      required int categoryId,
      required String name,
      required int points,
      required String status,
      required bool isFlag,
      required String location,
      required String description,
      required List<File> activityPhotos,
      required List<File> activityVideos})
      : super(
            id: id,
            points: points,
            status: status,
            user: user,
            updatedAt: updatedAt,
            isFlag: isFlag,
            createdAt: createdAt,
            categoryId: categoryId,
            name: name,
            location: location,
            description: description,
            activityPhotos: activityPhotos,
            activityVideos: activityVideos);

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
    isFlag: json['is_objected'],
    points: json['score'] ?? 0,
    user: json['user'],
    id: json['id'],
    status: json['status'],
    activityPhotos: List<FileModel>.from((json['activity_photos'] as List)
      .map((e) => FileModel.fromJson(e))),
    activityVideos: List<FileModel>.from((json['activity_videos'] as List)
        .map((e) => FileModel.fromJson(e))),
    name: json['name'],
    description: json['description'],
    categoryId: json['category'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    location: json['location']
  );

  Map<String, dynamic> toJson() => {
    'img_filename': activityPhotos,
    'vid_filename': activityVideos,
    'name': name,
    'is_objected': isFlag,
    'description': description,
    'location': location,
    'category': categoryId,
  };

}
