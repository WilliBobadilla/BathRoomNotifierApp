import 'package:bath_room_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    print("reading...");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.scan,
        child: Icon(Icons.camera),
      ),
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.ABOUT);
            },
            icon: Icon(Icons.question_mark),
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                  "Para cambiar el estado del baño, \n debes escanear el QR de la puerta, \n dependiendo de la situación",
                  style: TextStyle(fontSize: 22)),
            ],
          ),
          Obx(() => circleColor(controller.result.value)),
          Obx(() => Text(
                controller.result.value,
                style: TextStyle(fontSize: 20),
              )),
        ],
      )),
    );
  }

  Widget circleColor(String status) {
    print("resultado: " + status);
    Color itemColor;

    try {
      itemColor = controller.statuses[status];
    } catch (e) {
      print("escaneando error" + e.toString());
      //Get.defaultDialog(title: "Error ", content: Text("Error escaneando "));
      return Container(
        width: 100,
        height: 100,
        child: Container(),
      );
    }

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: itemColor,
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: Colors.grey.shade300)),
      child: itemColor != null
          ? const Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
          : Container(),
    );
  }
}
