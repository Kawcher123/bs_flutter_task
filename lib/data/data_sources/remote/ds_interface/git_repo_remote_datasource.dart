


import 'package:bs_flutter_task_kawcher/data/models/git_repo_model.dart';

abstract class GitRepoRemoteDatasource{
  Future<List<GitRepoModel>> getAllRepoFromApi({int page=1});
}