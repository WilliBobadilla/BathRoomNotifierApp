import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Status {
  ocupped,
  disoccupied,
}

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  RxString title = RxString("BathRoomApp");
  RxString result = RxString("");
  Map statuses = {"ocupped": Colors.red, "disoccupied": Colors.green};
  Map statusesICon = {
    "ocupped": Icon(
      Icons.check,
      color: Colors.white,
    ),
    "disoccupied": Icon(
      Icons.close,
      color: Colors.white,
    )
  };

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void scan() async {
    var result = await BarcodeScanner.scan();
    this.result.value = result.rawContent;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
