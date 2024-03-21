import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(()
      {
        if(controller.gitReposLoaded.isTrue)
          {
            return ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.gitRepositories.length,
              itemBuilder: (BuildContext context, int index) {


                return Column(
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(controller.gitRepositories[index].name),
                      ),
                    ),

                    if(index==controller.gitRepositories.length-1&&controller.isLoading.isTrue)
                        const Center(child: CircularProgressIndicator())


                  ],
                );
              },
            );
          }
        else
          {
            return const Center(child: CircularProgressIndicator());
          }
      }),
    );
  }
}
