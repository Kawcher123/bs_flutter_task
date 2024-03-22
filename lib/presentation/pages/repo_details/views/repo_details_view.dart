import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../infrastructure/services/url_launch_helper.dart';
import '../../../common/ui.dart';
import '../../../global_widgets/image_widget.dart';
import '../controllers/repo_details_controller.dart';

class RepoDetailsView extends GetView<RepoDetailsController> {
  RepoDetailsView({Key? key}) : super(key: key);

  final Size size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        title:  Text('Repository Details',style: Get.theme.textTheme.titleMedium,),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.theme.primaryColorDark,
            )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/git.png',
                    height: size.width * 0.06,
                    width: size.width * 0.06,
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Expanded(
                    child: Text(
                      'Github/App/#${controller.gitRepo.id}',
                      style: Get.textTheme.headlineSmall!.merge(TextStyle(color: Get.theme.disabledColor)),
                      maxLines: 3,
                      // textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                controller.gitRepo.name.capitalizeFirst ?? '',
                style: Get.textTheme.headlineLarge!.merge(TextStyle(
                  color: Get.theme.textTheme.titleLarge!.color,
                  fontWeight: FontWeight.bold,
                )),
                maxLines: 3,
                // textAlign: TextAlign.end,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Ui.commonUi.customSmallBox(
                    size: size.height * 0.1,
                    height: size.width * 0.08,
                    radius: 5,
                    color: Get.theme.primaryColorLight,
                    child: Row(
                      children: [
                        Icon(
                          Icons.stars_sharp,
                          color: Get.theme.disabledColor,
                        ),
                        Text(
                          controller.gitRepo.starCount.toString(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Ui.commonUi.customSmallBox(
                    size: size.height * 0.1,
                    height: size.width * 0.08,
                    radius: 5,
                    color: Get.theme.primaryColorLight,
                    child: const Text(
                      '#flutter',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Divider(height: 8, thickness: 1),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColorDark.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: ImageWidget(
                        imageUrl: controller.gitRepo.ownerPhoto ?? '',
                        height: size.width * 0.15,
                        width: size.width * 0.15,
                        imageBoxFit: 'cover',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  SizedBox(
                    width: size.width*0.75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.gitRepo.ownerName.capitalizeFirst ?? '',
                          style: Get.textTheme.titleLarge,
                          maxLines: 4,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                       GestureDetector(
                         onTap: ()
                         {
                           UrlLaunchHelper.urlLaunchHelper.urlLauncher(controller.gitRepo.ownerGit);
                         },
                         child:  Ui.commonUi.customSmallBox(
                           size: size.height * 0.1,
                           height: size.width * 0.08,
                           radius: 5,

                           color: Get.theme.primaryColorLight,
                           child: Row(
                             children: [
                               Image.asset(
                                 'assets/logo.png',
                                 height: size.width * 0.06,
                                 width: size.width * 0.06,
                               ),
                               SizedBox(
                                 width: size.width * 0.02,
                               ),
                               const Text(
                                 'Github',
                               ),
                             ],
                           ),
                         ),
                       )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Description',
                style: Get.textTheme.headlineMedium!.merge(TextStyle(
                  color: Get.theme.textTheme.titleMedium!.color,
                  fontWeight: FontWeight.bold,
                )),
                maxLines: 3,
                // textAlign: TextAlign.end,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Divider(height: 8, thickness: 1),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                controller.gitRepo.description ?? '',
                style: Get.textTheme.bodySmall,
                textAlign: TextAlign.justify,
                // textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ),

        floatingActionButton:
        FloatingActionButton.extended(
          onPressed:(){
            UrlLaunchHelper.urlLaunchHelper.urlLauncher(controller.gitRepo.url);
          },
          backgroundColor: Get.theme.primaryColorDark,
          label: const Text('View Repository'),
          icon: Image.asset(
            'assets/logo.png',
            height: size.width * 0.06,
            width: size.width * 0.06,
          ),
        )
    );
  }
}
