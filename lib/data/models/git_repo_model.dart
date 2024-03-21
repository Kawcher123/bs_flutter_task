import 'package:bs_flutter_task_kawcher/data/models/git_repo_database_fields_model.dart';
import 'package:bs_flutter_task_kawcher/domain/entities/git_repo_entity.dart';

class GitRepoModel extends GitRepoEntity {
  const GitRepoModel(
      {required int id,
      required String name,
      required String ownerName,
       String? ownerPhoto,
      required int starCount,
       String? description,
      required String updatedAt})
      : super(
          id: id,
          name: name,
          ownerName: ownerName,
          ownerPhoto: ownerPhoto??'',
          starCount: starCount,
          description: description,
          updatedAt: updatedAt,
        );

  factory GitRepoModel.fromJson(Map<String, dynamic> json) {
    return GitRepoModel(
      id: json[GitRepoDatabaseFields.id],
      name: json[GitRepoDatabaseFields.name],
      ownerName: getOwnerName(json),
      ownerPhoto: getOwnerPhoto(json),
      starCount: json[GitRepoDatabaseFields.starCount],
      description: json[GitRepoDatabaseFields.description]??'',
      updatedAt: json[GitRepoDatabaseFields.updatedAt],
    );
  }

  Map<String, Object?> toJson() => {
        GitRepoDatabaseFields.id: id,
        GitRepoDatabaseFields.name: name,
        GitRepoDatabaseFields.starCount: starCount,
        GitRepoDatabaseFields.ownerName: ownerName,
        GitRepoDatabaseFields.ownerPhoto: ownerPhoto,
        GitRepoDatabaseFields.description: description,
        GitRepoDatabaseFields.updatedAt: updatedAt,
      };

  static String getOwnerName(Map<String, dynamic> json) {
    if (json['owner'] != null && json['owner']['avatar_url'] != null) {
      return json['owner']['avatar_url'];
    }

    return '';
  }

  static String getOwnerPhoto(Map<String, dynamic> json) {
    if (json['owner'] != null && json['owner']['login'] != null) {
      return json['owner']['login'];
    }

    return 'NA';
  }
}
