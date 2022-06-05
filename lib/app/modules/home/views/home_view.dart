import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    print("reading...");
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
            child: Text("escanear"),
            onPressed: controller.scan,
          ),
          Obx(() => Text(controller.result.value))
        ],
      )),
    );
  }
}
