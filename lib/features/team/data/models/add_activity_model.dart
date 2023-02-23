import '../../domain/entities/add_activity.dart';

class AddActivityModel extends AddActivity {
  const AddActivityModel(
      {required String name,
      required bool isFlag,
      required String location,
      required String description,
      required List<String> activityPhotos,
      required List<String> activityVideos,
      required int categoryId})
      : super(
            name: name,
            isFlag: isFlag,
            location: location,
            description: description,
            activityPhotos: activityPhotos,
            activityVideos: activityVideos,
            categoryId: categoryId);

  Map<String, dynamic> toJson() => {
        'img_filename': activityPhotos[0],
        'vid_filename': activityVideos[0],
        'name': name,
        'description': description,
        'location': location,
        'is_objected': isFlag,
        'category': categoryId,
      };
}
