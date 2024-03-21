import 'package:get/get.dart';

import 'internet_connectivity_check_controller.dart';
class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectivityController>(() => ConnectivityController());

  }
}