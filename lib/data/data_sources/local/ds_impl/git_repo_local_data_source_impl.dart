import 'package:bs_flutter_task_kawcher/data/data_sources/local/database_service/git_repo_db.dart';
import 'package:bs_flutter_task_kawcher/data/data_sources/local/ds_interface/git_repo_local_data_source.dart';
import 'package:bs_flutter_task_kawcher/data/models/git_repo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class GitRepoLocalDataSourceImpl implements GitRepoLocalDatasource {
  @override
  Future<List<GitRepoModel>> saveRepoToLocalDB(GitRepoModel gitRepoModel) async {
    // TODO: implement addToCartRepoFromLocalDB
    List<GitRepoModel> gitRepoList = [];

    try {
      gitRepoList = await GitRepoDatabase.gitRepoDbSource.updateOrInsertItem(gitRepoModel);
    } on DatabaseException catch (e) {
      // TODO

      debugPrint('error during saving repo in database: ${e.isUniqueConstraintError()}');
      rethrow;
    }
    return gitRepoList;
  }

  @override
  Future<List<GitRepoModel>> deleteRepoListFromLocalDB() {
    // TODO: implement deleteFromRepoListFromLocalDB
    throw UnimplementedError();
  }

  @override
  Future<List<GitRepoModel>> getAllRepoListFromLocalDB() async {
    // TODO: implement getAllRepoListFromLocalDB
    List<GitRepoModel> gitRepoList = [];

    try {
      gitRepoList = await GitRepoDatabase.gitRepoDbSource.readAll();
    } catch (e) {
      // TODO

      debugPrint('error during getting repo from database: $e');
      rethrow;
    }
    return gitRepoList;
  }

  @override
  Future<List<GitRepoModel>> updateRepoFromLocalDB(GitRepoModel gitRepoModel) {
    // TODO: implement updateCartRepoFromLocalDB
    throw UnimplementedError();
  }
}
