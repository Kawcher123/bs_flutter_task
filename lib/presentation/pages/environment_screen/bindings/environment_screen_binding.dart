import 'package:bs_flutter_task_kawcher/presentation/pages/home/bindings/home_binding.dart';
import 'package:get/get.dart';

import '../controllers/environment_screen_controller.dart';

class EnvironmentScreenBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<EnvironmentScreenController>(
      () => EnvironmentScreenController(),
    );
    HomeBinding().dependencies();
  }
}
