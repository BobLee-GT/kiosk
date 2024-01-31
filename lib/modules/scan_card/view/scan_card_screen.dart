
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medipay/utils/common/asset/animation.dart';
import 'package:medipay/utils/common/asset/svg.dart';

import '../../../utils/common/asset/image.dart';
import '../../../utils/common/button.dart';
import '../../../utils/common/color.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/body/body.dart';
import '../../../utils/widget/header/header.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/scan_card_controller.dart';

part 'body.dart';

class ScanCardScreen extends GetView<ScanCardController>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            HeaderCommon.baseHeader(),
            Expanded(child: _body()),
          ],
        ),
      ),
    );
  }

}