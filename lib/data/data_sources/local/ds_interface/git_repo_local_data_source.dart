import 'package:bs_flutter_task_kawcher/data/models/git_repo_model.dart';

abstract class GitRepoLocalDatasource {
  Future<List<GitRepoModel>> getAllRepoListFromLocalDB();
  Future<List<GitRepoModel>> saveRepoToLocalDB(GitRepoModel gitRepoModel);
  Future<List<GitRepoModel>> updateRepoFromLocalDB(GitRepoModel gitRepoModel);
  Future<List<GitRepoModel>> deleteRepoListFromLocalDB();
}