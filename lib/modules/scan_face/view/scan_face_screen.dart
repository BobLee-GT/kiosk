
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medipay/utils/common/color.dart';
import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/button.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/body/body.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/scan_face_controller.dart';
import 'package:camera_platform_interface/src/platform_interface/camera_platform.dart';

part 'body.dart';

class ScanFaceScreen extends GetView<ScanFaceController>{
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: _body()),
            ],
          ),
      ),
    );
  }

}