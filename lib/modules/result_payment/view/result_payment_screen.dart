import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medipay/model/cccd/data_cccd.dart';
import 'package:medipay/utils/common/color.dart';
import 'package:medipay/utils/common/data.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/common/asset/image.dart';
import '../../../utils/common/button.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/body/body.dart';
import '../../../utils/widget/header/header.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/result_payment_controller.dart';

part 'body.dart';

class ResultPaymentScreen extends GetView<ResultPaymentController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          HeaderCommon.baseHeader(),
          Expanded(child: _body()),
        ],
      ),
    );
  }
}