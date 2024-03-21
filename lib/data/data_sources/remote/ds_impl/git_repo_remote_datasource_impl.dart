import 'dart:convert';
import 'dart:developer';

import 'package:bs_flutter_task_kawcher/data/models/git_repo_model.dart';

import '../../../exceptions/customExceptions.dart';
import '../api_manager/api_manager.dart';
import '../api_manager/api_url.dart';
import '../ds_interface/git_repo_remote_datasource.dart';

class GitRepoRemoteDatasourceImpl implements GitRepoRemoteDatasource {
  GitRepoRemoteDatasourceImpl(this._apiManager);
  final APIManager _apiManager;

  @override
  Future<List<GitRepoModel>> getAllRepoFromApi({int page=1}) async {
    // TODO: implement getAllRepoFromApi

    try {
      final response = await _apiManager.getWithHeader(
        url: ApiUrl.getRepoList(page: page),
        headerData: {},
      );

      log('GitRepoRemoteDatasourceImpl.getAllRepoFromApi:${jsonEncode(response)}');

      return List.from(response['items'].map((item) => GitRepoModel.fromJson(item)));
    } on Exception catch (e) {
      // TODO
      throw ServerException();
    }
  }
}
