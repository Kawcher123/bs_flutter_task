import 'package:bs_flutter_task_kawcher/config.dart';

class ApiUrl {
  static  String baseUrl = ConfigEnvironments.getEnvironments()['url']??'';
  static  String getRepoList({int page=1, String sort='stars'}) => '${baseUrl}search/repositories?q=Flutter&page=$page&per_page=10&sort=$sort';
}
