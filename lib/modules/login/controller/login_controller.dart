import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medipay/my_app.dart';
import 'package:medipay/my_app01.dart';
import 'package:medipay/routes/app_pages.dart';

class LoginController extends GetxController {

  void onTapCCCD(){
    // Get.toNamed(Routes.SCANID);
    Navigator.of(Get.context!).push(MaterialPageRoute(builder: (context) => MyApp1()));
  }

  void onTapBHYT(){
    Navigator.of(Get.context!).push(MaterialPageRoute(builder: (context) => MyApp()));
  }
}
