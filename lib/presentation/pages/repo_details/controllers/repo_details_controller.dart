import 'package:get/get.dart';

import '../../../../domain/entities/git_repo_entity.dart';

class RepoDetailsController extends GetxController {
  //TODO: Implement RepoDetailsController

  late GitRepoEntity gitRepo;
  @override
  void onInit() {
    super.onInit();
    gitRepo=Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }



}
