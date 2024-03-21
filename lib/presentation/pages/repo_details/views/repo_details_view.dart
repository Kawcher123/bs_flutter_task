import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/repo_details_controller.dart';

class RepoDetailsView extends GetView<RepoDetailsController> {
  const RepoDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RepoDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RepoDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
