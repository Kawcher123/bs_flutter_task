import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  RxInt connectionType = 1.obs;

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;

  final isFirstTime = true.obs;
  final isOnline = false.obs;

  @override
  Future<void> onInit() async {
    await getConnectionType();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(_updateState);
    isFirstTime.value = true;
    super.onInit();
  }

  Future<void> getConnectionType() async {
    ConnectivityResult? connectivityResult;
    try {
      debugPrint('ConnectivityController.getConnectionType');
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult? result) {
    switch (result) {
      case ConnectivityResult.wifi:
        debugPrint('ConnectivityController._updateState wifi');
        connectionType.value = 1;

        break;
      case ConnectivityResult.mobile:
        debugPrint('ConnectivityController._updateState mobile');
        connectionType.value = 2;
        break;
      case ConnectivityResult.none:
        debugPrint('ConnectivityController._updateState none:${isFirstTime.value}');
        connectionType.value = 0;
        break;
      default:
        connectionType.value = 0;
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }


}
