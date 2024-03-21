import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'dependency_injections/dependency_injection.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/services/internet_connectivity_check_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute = await Routes.initialRoute;
  await DependencyInjection.init();
  await Get.putAsync<ConnectivityService>(() async => ConnectivityService());
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
