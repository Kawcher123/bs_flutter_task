import 'package:bs_flutter_task_kawcher/data/data_sources/remote/ds_interface/git_repo_remote_datasource.dart';
import 'package:bs_flutter_task_kawcher/domain/entities/git_repo_entity.dart';
import 'package:bs_flutter_task_kawcher/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/repositories/git_rep_repository.dart';
import '../exceptions/customExceptions.dart';

class GitRepRepositoryImpl implements GitRepRepository {
  GitRepRepositoryImpl(this._gitRepRemoteDatasource);
  final GitRepoRemoteDatasource _gitRepRemoteDatasource;

  @override
  Future<Either<Failure, List<GitRepoEntity>>> getGitRepoFromDatasource({int page=1}) async {
    // TODO: implement getGitRepoFromDatasource
    try {
      final List<GitRepoEntity> gitReposModels = await _gitRepRemoteDatasource.getAllRepoFromApi(page: page);

      return right(gitReposModels);
    } on ServerException catch (_) {
      debugPrint('GitRepRepositoryImpl.getGitRepoFromDatasource: $_');
      return left(ServerFailure());
    } catch (e) {
      debugPrint('GitRepRepositoryImpl.getGitRepoFromDatasource: $e');
      return left(GeneralFailure());
    }
  }

  @override
  Future<void> saveRepoDataLocally(List<GitRepoEntity> repos) {
    // TODO: implement saveDataLocally
    throw UnimplementedError();
  }
}
