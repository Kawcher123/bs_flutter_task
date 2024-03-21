import 'package:bs_flutter_task_kawcher/domain/entities/git_repo_entity.dart';
import 'package:bs_flutter_task_kawcher/domain/use_cases/git_repo_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final GitRepoUseCase _getGitReposUseCase;

  HomeController(this._getGitReposUseCase);

  final ScrollController scrollController = ScrollController();
  RxList<GitRepoEntity> gitRepositories = <GitRepoEntity>[].obs;
  RxBool gitReposLoaded = false.obs;
  RxBool isLoading = false.obs;
  RxInt pageNo = 1.obs;
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_loadMoreData);
    _fetchRepos();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _loadMoreData() async {
    isLoading.value = true;
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {

      pageNo.value = pageNo.value + 1;

      print('HomeController._loadMoreData:${pageNo.value}');

      final result = await _getGitReposUseCase.getGitRepoUseCase(page: pageNo.value);
      print('HomeController._loadMoreData');
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
}
