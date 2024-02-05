
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medipay/utils/common/asset/image.dart';
import 'package:medipay/utils/common/color.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/button.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/body/body.dart';
import '../../../utils/widget/header/header.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/signature_pad_controller.dart';

import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';


part 'body.dart';

class SignaturePadScreen extends GetView<SignaturePadController>{
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