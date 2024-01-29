import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medipay/utils/common/color.dart';

import '../../../model/cccd/data_cccd.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common/asset/image.dart';
import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/button.dart';
import '../../../utils/common/data.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/body/body.dart';
import '../../../utils/widget/header/header.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/result_register_controller.dart';

part 'body.dart';

class ResultRegisterScreen extends GetView<ResultRegisterController> {
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