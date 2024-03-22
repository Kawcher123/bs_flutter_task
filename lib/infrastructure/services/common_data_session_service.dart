import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CommonDataSessionService extends GetxService {
  late GetStorage _box;
  RxString sortingOption = 'stargazers_count'.obs;
  CommonDataSessionService() {
    _box = GetStorage();
  }
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    getFilterOption();
  }

  void saveFilterOption(String option) {
    _box.write(DbStrings.fillter_option, option);
    getFilterOption();
  }

  void getFilterOption() {
    if (_box.hasData(DbStrings.fillter_option)) {
      sortingOption.value = _box.read(
        DbStrings.fillter_option,
      );
    }

    print('CommonDataSessionService.getFilterOption:${sortingOption.value}');
  }
}

class DbStrings {
  static const dbName = 'local_save';
  static const fillter_option = 'filter_option';
}
