import 'package:get/get.dart';
import '../../presentation/pages/environment_screen/bindings/environment_screen_binding.dart';
import '../../presentation/pages/environment_screen/views/environment_screen_view.dart';
import '../../presentation/pages/home/bindings/home_binding.dart';
import '../../presentation/pages/home/views/home_view.dart';
import '../../presentation/pages/repo_details/bindings/repo_details_binding.dart';
import '../../presentation/pages/repo_details/views/repo_details_view.dart';
import 'routes.dart';


class Nav {
  static List<GetPage> routes = [
    GetPage(
        name: Routes.ENV,
        page: () => const EnvironmentScreenView(),
        binding:EnvironmentScreenBinding()
    ),
    GetPage(
      name: Routes.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.REPO_DETAILS,
      page: () =>  RepoDetailsView(),
      binding: RepoDetailsBinding(),
    ),
  ];
}
