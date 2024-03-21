import 'package:bs_flutter_task_kawcher/data/data_sources/local/ds_interface/git_repo_local_data_source.dart';
import 'package:bs_flutter_task_kawcher/data/data_sources/remote/ds_interface/git_repo_remote_datasource.dart';
import 'package:bs_flutter_task_kawcher/domain/entities/git_repo_entity.dart';
import 'package:bs_flutter_task_kawcher/domain/extensions/git_repo_entity_extension.dart';
import 'package:bs_flutter_task_kawcher/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/repositories/git_rep_repository.dart';
import '../exceptions/customExceptions.dart';

class GitRepRepositoryImpl implements GitRepRepository {
  GitRepRepositoryImpl(this._gitRepRemoteDatasource,this._gitRepoLocalDatasource);
  final GitRepoRemoteDatasource _gitRepRemoteDatasource;
  final GitRepoLocalDatasource _gitRepoLocalDatasource;

  @override
  Future<Either<Failure, List<GitRepoEntity>>> getGitRepoFromDatasource({int page=1}) async {
    // TODO: implement getGitRepoFromDatasource
    try {
       List<GitRepoEntity> gitReposList = await _gitRepRemoteDatasource.getAllRepoFromApi(page: page);
      gitReposList=await  saveRepoDataLocally(gitReposList);
      return right(gitReposList);
    } on ServerException catch (_) {
      debugPrint('GitRepRepositoryImpl.getGitRepoFromDatasource: $_');
      return left(ServerFailure());
    } catch (e) {
      debugPrint('GitRepRepositoryImpl.getGitRepoFromDatasource: $e');
      return left(GeneralFailure());
    }
  }

  @override
  Future<List<GitRepoEntity>> saveRepoDataLocally(List<GitRepoEntity> repos) async{
    // TODO: implement saveDataLocally
    List<GitRepoEntity> repoList=[];
    for(GitRepoEntity item in repos){
      repoList= await _gitRepoLocalDatasource.saveRepoToLocalDB(item.toModel());
    }
    return repoList;
  }

  @override
  Future<Either<Failure, List<GitRepoEntity>>> getGitRepoFromLocalDatasource() async {
    // TODO: implement getGitRepoFromLocalDatasource
    try {
      List<GitRepoEntity> gitReposList = await _gitRepoLocalDatasource.getAllRepoListFromLocalDB();
      return right(gitReposList);
    } on ServerException catch (_) {
      debugPrint('GitRepRepositoryImpl.getGitRepoFromDatasource: $_');
      return left(ServerFailure());
    } catch (e) {
      debugPrint('GitRepRepositoryImpl.getGitRepoFromDatasource: $e');
      return left(GeneralFailure());
    }
  }
}
