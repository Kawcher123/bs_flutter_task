import 'package:bs_flutter_task_kawcher/domain/entities/git_repo_entity.dart';
import 'package:bs_flutter_task_kawcher/domain/use_cases/git_repo_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/services/internet_connectivity_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final GitRepoUseCase _getGitReposUseCase;
  final InternetConnectionService _internetConnectionService;

  HomeController(this._getGitReposUseCase, this._internetConnectionService);

  final ScrollController scrollController = ScrollController();

  RxList<GitRepoEntity> gitRepositories = <GitRepoEntity>[].obs;
  RxBool gitReposLoaded = false.obs;
  RxBool isLoading = false.obs;
  RxInt pageNo = 1.obs;

  String? refreshTime;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_loadMoreData);
    fetchRepositories();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchRepositories() async {
    bool hasInternet = await _internetConnectionService.checkInternet();
    debugPrint('HomeController.onInit:${hasInternet}');
    if (hasInternet == true) {
      _fetchRepos();
    } else {
      fetchReposFromLocal();
    }
  }

  Future<void> _loadMoreData() async {
    isLoading.value = true;
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      pageNo.value = pageNo.value + 1;

      debugPrint('HomeController._loadMoreData:${pageNo.value}');

      final result = await _getGitReposUseCase.getGitRepoUseCase(page: pageNo.value);
      debugPrint('HomeController._loadMoreData');
      isLoading.value = false;
      result.fold((failure) {
        debugPrint('HomeController._fetchRepos:$failure');
      }, (repos) {
        gitRepositories.addAll(repos);
      });
    }
  }

  Future<void> _fetchRepos() async {
    final result = await _getGitReposUseCase.getGitRepoUseCase(page: 1);

    result.fold((failure) {
      debugPrint('HomeController._fetchRepos:$failure');
    }, (repos) {
      gitRepositories.assignAll(repos);
      gitReposLoaded.value = true;
    });
  }

  Future<void> fetchReposFromLocal() async {
    final result = await _getGitReposUseCase.getGitRepoFromLocalUseCase();

    result.fold((failure) {
      debugPrint('HomeController._fetchReposFromLocal:$failure');
    }, (repos) {
      gitRepositories.assignAll(repos);
      gitReposLoaded.value = true;
    });
  }

  int calculateDifferenceInMinutes(DateTime oldTime, DateTime currentTime) {
    Duration difference = currentTime.difference(oldTime);
    int differenceInMinutes = difference.inMinutes;
    return differenceInMinutes;
  }

  void refreshHome() {
    DateTime currentTime = DateTime.now();

    if (refreshTime == null || calculateDifferenceInMinutes(DateTime.parse(refreshTime!),currentTime) >= 30) {
      fetchRepositories();
      refreshTime = currentTime.toString();
    }
  }
}
