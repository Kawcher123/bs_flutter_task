import 'package:get/get.dart';

import '../../../../dependency_injections/dependency_injection.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(DependencyInjection.getIt()),
    );
  }
}
