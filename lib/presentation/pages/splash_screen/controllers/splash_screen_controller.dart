import 'dart:async';

import 'package:bs_flutter_task_kawcher/infrastructure/navigation/routes.dart';
import 'package:bs_flutter_task_kawcher/infrastructure/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  @override
  void onInit() {
    debugPrint('called');
    Timer(const Duration(seconds: 3), () {
     if(Get.find<AuthService>().hasApiToken)
       {
         Get.offAllNamed(Routes.ENV);
       }
    });
    super.onInit();
  }
}
