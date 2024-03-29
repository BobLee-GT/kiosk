
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medipay/utils/common/color.dart';
import '../../../utils/common/asset/svg.dart';
import '../../../utils/common/data.dart';
import '../../../utils/common/text_style.dart';
import '../../../utils/widget/body/body.dart';
import '../../../utils/widget/header/header.dart';
import '../../../utils/widget/space/space.dart';
import '../../../utils/widget/text/montserrat.dart';
import '../controller/make_appointment_controller.dart';

part 'body.dart';

class MakeAppointmentScreen extends GetView<MakeAppointmentController>{
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
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