import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/ui.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.find<SplashScreenController>();
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [

            Center(
              child:Image(
                height: size.width,
                width: size.width * .8,
                image: const AssetImage(
                  'assets/logo.png',
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Ui.commonUi.customBottomLoader(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Preparing...',
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
