
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  late GetStorage _box;
  final RxBool _accessTokenFound = true.obs;
  AuthService() {
    _box = GetStorage();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    getToken();
    super.onInit();
  }

  setToken(String token) {}

  getToken() {
    _accessTokenFound.value = true;
  }

  bool get hasApiToken => _accessTokenFound.value;
}
