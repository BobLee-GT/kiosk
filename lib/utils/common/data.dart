
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../model/cccd/data_cccd.dart';

class AppDataGlobal {
  static const String appName = '';
  static  String fcmToken = "";
  static String evironment = '';


  static String kioskSeriNo = 'Abc123';

  static double safeBottom =
      MediaQuery.of(Get.context!).viewPadding.bottom;

  static bool isShowPopup = false;

  static OverlayEntry? overlayEntry;
  static int? currentPriorityPopup;
  /// Data app life cycle
  static DateTime? timeAppPaused;
  /// True is turn on, false is turn off
  static RxBool internetStatus = true.obs;
  static bool isPopupVisible = false;
  /// 3 Type: FaceID, TouchID, and empty
  static String biometricType = '';
  /// True is turn on, false is turn off
  static RxBool biometricStatus = false.obs;
  /// Use for verify OTP screen - set time to resend otp
  static const int timeToReSendOTP = 90;


  /// Data CCCD Register
  static Rx<CccdDataModel> dataCCCDScan = Rx(CccdDataModel(eidNumber: ''));
}

//Config API
String MAIN_URL = '';

// Define Theme
const DARK_THEME = 'DARK';
const LIGHT_THEME = 'LIGHT';

// URL DOWNLOAD APP
const URL_ANDROID = '';
const URL_IOS = '';
