
import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medipay/utils/common/asset/animation.dart';
import 'package:medipay/utils/common/asset/image.dart';
import 'package:medipay/utils/common/asset/svg.dart';
import 'package:medipay/utils/common/color.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/common/button.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/body/body.dart';
import '../../../utils/widget/header/header.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/advance_payment_controller.dart';

part 'body.dart';
part 'card_pos.dart';
part 'qr_code.dart';

class AdvancePaymentScreen extends GetView<AdvancePaymentController>{
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