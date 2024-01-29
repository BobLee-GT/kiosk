import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medipay/utils/common/asset/image.dart';
import 'package:medipay/utils/common/asset/svg.dart';
import 'package:medipay/utils/common/button.dart';
import 'package:medipay/utils/common/color.dart';
import 'package:medipay/utils/common/text_style.dart';
import 'package:medipay/utils/widget/body/body.dart';
import 'package:medipay/utils/widget/header/header.dart';
import 'package:medipay/utils/widget/space/space.dart';
import 'package:medipay/utils/widget/text/montserrat.dart';

import '../controller/login_controller.dart';

part 'body.dart';

class LoginScreen extends GetView<LoginController> {
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
