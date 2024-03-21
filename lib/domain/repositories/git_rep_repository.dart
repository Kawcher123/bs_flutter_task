import 'package:bs_flutter_task_kawcher/domain/entities/git_repo_entity.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class GitRepRepository
{
  Future<Either<Failure, List<GitRepoEntity>>> getGitRepoFromDatasource({int page=1});
  Future<void> saveRepoDataLocally(List<GitRepoEntity> repos);
}