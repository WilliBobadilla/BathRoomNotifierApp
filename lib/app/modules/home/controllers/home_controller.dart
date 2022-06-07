import 'dart:convert';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:bath_room_app/app/data/db.dart';
import 'package:firebase_database/firebase_database.dart';
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

  late DatabaseEvent listenStatus;
  FireBaseConnection fireBaseConn = FireBaseConnection(refDB: "status");

  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  late Stream<DatabaseEvent> stream;

  @override
  void onInit() async {
    super.onInit();
    stream = databaseReference.onValue;
    print("Conexxion");
    print(fireBaseConn);
    updateData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void updateData() {
    stream.listen((DatabaseEvent event) {
      var data = event.snapshot.child("status").value;
      this.result.value = data.toString(); //update UI
    });
  }

  void scan() async {
    var result = await BarcodeScanner.scan();
    this.result.value = result.rawContent;
    this.updateDB(result.rawContent);
  }

  void updateDB(String status) {
    databaseReference.update({'status': status});
  }

  @override
  void onClose() {
    super.onClose();
  }
}
