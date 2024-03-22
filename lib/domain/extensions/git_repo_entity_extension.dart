import '../../data/models/git_repo_model.dart';
import '../entities/git_repo_entity.dart';

extension GitRepoEntityExtension on GitRepoEntity {
  GitRepoModel toModel() {
    return GitRepoModel(
      id: id,
      name: name,
      ownerName: ownerName,
      ownerPhoto: ownerPhoto,
      starCount: starCount,
      description: description,
      url: url,
      ownerGit: ownerGit,
      updatedAt: updatedAt,
    );
  }
}
