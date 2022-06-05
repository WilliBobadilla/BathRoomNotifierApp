import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  RxString title = RxString("Home");
  RxString result = RxString("");
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
    print(result);
    this.result.value = result.rawContent;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onQrCreated(String controller) {}
}
