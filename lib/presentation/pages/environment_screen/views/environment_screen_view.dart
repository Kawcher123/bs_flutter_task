import 'package:bs_flutter_task_kawcher/presentation/pages/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config.dart';
import '../controllers/environment_screen_controller.dart';

class EnvironmentScreenView extends GetView<EnvironmentScreenController> {
  const EnvironmentScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
      location: BannerLocation.topStart,
      message: env!,
      color: env == Environments.QAS ? Colors.blue : Colors.purple,
      child:  HomeView(),
    )
        :  SizedBox(child: HomeView());
  }
}
