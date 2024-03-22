import 'package:bs_flutter_task_kawcher/infrastructure/extensions/date_extensions.dart';
import 'package:bs_flutter_task_kawcher/infrastructure/internet_connectivity/internet_connectivity_check_controller.dart';
import 'package:bs_flutter_task_kawcher/infrastructure/navigation/routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../infrastructure/services/common_data_session_service.dart';
import '../../../common/ui.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final Size size = Get.size;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Get.theme.primaryColorDark,
      color: Get.theme.cardColor,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
       controller.refreshHome();
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: size.height*0.3,
                  width: size.width,
                  decoration:  BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                          0.2,
                          0.9,
                        ],
                        colors: [
                          Get.theme.primaryColorDark,
                          Get.theme.primaryColorDark.withOpacity(0.1),
                        ],
                      )),
                ),
              ),
            ),
             Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Text(
                    'Repositories',
                    style: Get.theme.textTheme.titleMedium!.merge(
                      TextStyle(
                        color: Get.theme.cardColor,
                      )
                    ),
                  ),
                ),
              ),
            ),

            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child:  Padding(
                  padding: const EdgeInsets.only(top: 20.0,right: 5),
                  child: PopupMenuButton(
                      position: PopupMenuPosition.under,
                      icon: Icon(
                        Icons.filter_list_alt,
                        color: Get.theme.cardColor,
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
                      onSelected: (value) {
                        if(value==1){
                          Get.find<CommonDataSessionService>().saveFilterOption('stargazers_count');
                          controller.fetchReposFromLocal();
                        }
                        else
                        {
                          Get.find<CommonDataSessionService>().saveFilterOption('updated_at');
                          controller.fetchReposFromLocal();
                        }
                      }),
                ),
              ),
            ),

            Positioned(
              top: size.height*0.12,

              child: Container(
                height: size.height,
                width: size.width,
                decoration:  BoxDecoration(
                  color: Get.theme.cardColor,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                ),
                child: Obx(() {
                  if (controller.gitReposLoaded.isTrue) {
                    return ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.gitRepositories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: ()
                              {
                                Get.toNamed(Routes.REPO_DETAILS,arguments:controller.gitRepositories[index] );
                              },
                              child: Container(
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
                                            child: Text('Updated Time',
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
                                                    DateTime.parse(controller.gitRepositories[index].updatedAt??'').toFormattedTime,
                                                    maxLines: 1,
                                                    style: Get.textTheme.bodySmall!.merge(
                                                      TextStyle(color: Get.theme.primaryColor, height: 1.4),
                                                    ),
                                                    softWrap: false,
                                                    textAlign: TextAlign.center,
                                                    overflow: TextOverflow.fade),
                                                Text(    DateTime.parse(controller.gitRepositories[index].updatedAt??'').toFormattedDay,
                                                    maxLines: 1,
                                                    style: Get.textTheme.headlineMedium!.merge(
                                                      TextStyle(color: Get.theme.primaryColor, height: 1),
                                                    ),
                                                    softWrap: false,
                                                    textAlign: TextAlign.center,
                                                    overflow: TextOverflow.fade),
                                                Text(    DateTime.parse(controller.gitRepositories[index].updatedAt??'').toFormattedMonth,
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
                                                    controller.gitRepositories[index].name??'',
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
                                                    controller.gitRepositories[index].ownerName??'',
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
                            ),
                            if (index == controller.gitRepositories.length - 1 &&
                                controller.isLoading.isTrue &&
                                Get.find<ConnectivityController>().connectionType != ConnectivityResult.none)
                               SizedBox(
                                height: size.height*0.2,
                                width:size.width,
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: Center(child: CircularProgressIndicator()),
                                    ),
                                    SizedBox(
                                      height: size.height*0.1,

                                    )
                                  ],
                                ),
                              )
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                      ),
                    );
                  }
                }),
              ),
            ),




          ],
        ),
      ),
    );

  }
}
