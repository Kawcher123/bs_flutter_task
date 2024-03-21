import 'package:bs_flutter_task_kawcher/infrastructure/internet_connectivity/internet_connectivity_check_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/ui.dart';
import '../../../global_widgets/text_field_widget.dart';
import '../controllers/home_controller.dart';
import 'package:intl/intl.dart' show DateFormat;

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  Size size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColorDark,
        title: Text('Git Repositories',

        style: Get.theme.textTheme.titleLarge,),
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ui.commonUi.customSmallBox(
              size: size.height * 0.06,
              radius: 5,
              color: Get.theme.cardColor,
              child: PopupMenuButton(
                  position: PopupMenuPosition.under,
                  icon: Icon(
                    Icons.filter_list_alt,
                    color: Get.theme.primaryColor,
                  ),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text("Sort by starred"),
                      ),
                      const PopupMenuItem<int>(
                        value: 2,
                        child: Text("Sort by updated date"),
                      ),
                    ];
                  },
                  onSelected: (value) {}),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.gitReposLoaded.isTrue) {
          return ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.gitRepositories.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: Ui.commonUi.getBoxDecoration(
                      color: Get.theme.cardColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Get.theme.focusColor.withOpacity(0.2),
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))),
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                              child: Center(
                                child: Text('Updated At',
                                    style: Get.textTheme.titleLarge!.merge(
                                      const TextStyle(fontSize: 10),
                                    ),
                                    maxLines: 1,
                                    softWrap: false,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.fade),
                              ),
                            ),
                            Container(
                              width: 80,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Get.theme.primaryColor.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        DateFormat.jm().format(DateTime.parse(controller.gitRepositories[index].updatedAt).toUtc()),
                                        maxLines: 1,
                                        style: Get.textTheme.bodySmall!.merge(
                                          TextStyle(color: Get.theme.primaryColor, height: 1.4),
                                        ),
                                        softWrap: false,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade),
                                    Text(DateTime.parse(controller.gitRepositories[index].updatedAt).toUtc().day.toString(),
                                        maxLines: 1,
                                        style: Get.textTheme.headlineMedium!.merge(
                                          TextStyle(color: Get.theme.primaryColor, height: 1),
                                        ),
                                        softWrap: false,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade),
                                    Text(DateFormat('MMM').format(DateTime.parse(controller.gitRepositories[index].updatedAt)),
                                        maxLines: 1,
                                        style: Get.textTheme.bodySmall!.merge(
                                          TextStyle(color: Get.theme.primaryColor, height: 1),
                                        ),
                                        softWrap: false,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Opacity(
                            opacity: 1,
                            child: Wrap(
                              runSpacing: 10,
                              alignment: WrapAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        controller.gitRepositories[index].name,
                                        style: Get.textTheme.headlineSmall,
                                        maxLines: 3,
                                        // textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(height: 8, thickness: 1),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_pin_circle_rounded,
                                      size: 18,
                                      color: Get.theme.focusColor,
                                    ),
                                    const SizedBox(width: 5),
                                    Flexible(
                                      child: Text(
                                        controller.gitRepositories[index].ownerName,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        style: Get.textTheme.bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.stars_sharp,
                                      size: 18,
                                      color: Get.theme.focusColor,
                                    ),
                                    const SizedBox(width: 5),
                                    Flexible(
                                      child: Text(
                                        controller.gitRepositories[index].starCount.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        style: Get.textTheme.bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(height: 8, thickness: 1),
                                Text(
                                  controller.gitRepositories[index].description??'',
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: Get.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index == controller.gitRepositories.length - 1 &&
                      controller.isLoading.isTrue &&
                      Get.find<ConnectivityController>().connectionType != ConnectivityResult.none)
                    const Center(child: CircularProgressIndicator())
                ],
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      }),
    );
  }
}
