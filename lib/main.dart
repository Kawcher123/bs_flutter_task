import 'package:bs_flutter_task_kawcher/infrastructure/internet_connectivity/internet_connectivity_binding.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'dependency_injections/dependency_injection.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/services/common_data_session_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute = await Routes.initialRoute;
  await GetStorage.init();
  await Get.putAsync<CommonDataSessionService>(() async => CommonDataSessionService());
  await DependencyInjection.init();

  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
