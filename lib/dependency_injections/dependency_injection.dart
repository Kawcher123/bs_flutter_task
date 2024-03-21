import 'package:bs_flutter_task_kawcher/data/data_sources/remote/ds_interface/git_repo_remote_datasource.dart';
import 'package:bs_flutter_task_kawcher/data/data_sources/remote/ds_impl/git_repo_remote_datasource_impl.dart';
import 'package:bs_flutter_task_kawcher/data/repositories/git_rep_repo_impl.dart';
import 'package:bs_flutter_task_kawcher/domain/repositories/git_rep_repository.dart';
import 'package:bs_flutter_task_kawcher/domain/use_cases/git_repo_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../data/data_sources/local/ds_impl/git_repo_local_data_source_impl.dart';
import '../data/data_sources/local/ds_interface/git_repo_local_data_source.dart';
import '../data/data_sources/remote/api_manager/api_manager.dart';
import '../presentation/pages/home/controllers/home_controller.dart';

class DependencyInjection {
  static final GetIt getIt = GetIt.instance;

  static Future<void> init() async {

    getIt.registerLazySingleton<http.Client>(() => http.Client());

    getIt.registerLazySingleton<APIManager>(() => APIManager(getIt()));

    getIt.registerLazySingleton<GitRepoRemoteDatasource>(() => GitRepoRemoteDatasourceImpl(getIt()));
    getIt.registerLazySingleton<GitRepoLocalDatasource>(() => GitRepoLocalDataSourceImpl());
    getIt.registerLazySingleton<GitRepRepository>(() => GitRepRepositoryImpl(getIt(),getIt()));
    getIt.registerLazySingleton<GitRepoUseCase>(() => GitRepoUseCase(getIt()));

    getIt.registerLazySingleton<HomeController>(() => HomeController(getIt()));
  }
}