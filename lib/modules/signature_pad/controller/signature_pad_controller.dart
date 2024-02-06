import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignaturePadController extends GetxController{
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

  void getImageFromSignaturePad() async{
    final data =
    await signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ImageByteFormat.png);

  }

  void clearSignaturePad() async{
    signaturePadKey.currentState?.clear();
  }
}