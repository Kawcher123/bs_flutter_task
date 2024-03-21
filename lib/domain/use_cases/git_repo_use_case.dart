import 'package:bs_flutter_task_kawcher/domain/entities/git_repo_entity.dart';
import 'package:bs_flutter_task_kawcher/domain/repositories/git_rep_repository.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

class GitRepoUseCase {
  final GitRepRepository _repository;

  GitRepoUseCase(this._repository);

  Future<Either<Failure, List<GitRepoEntity>>> getGitRepoUseCase({required int page}) {
    return _repository.getGitRepoFromDatasource(page: page);
  }
}
