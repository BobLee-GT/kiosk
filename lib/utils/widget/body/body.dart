import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medipay/utils/common/data.dart';
import 'package:medipay/utils/common/text_style.dart';
import 'package:medipay/utils/widget/text/montserrat.dart';

import '../../common/asset/image.dart';
import '../../common/color.dart';

class BodyCommon {
  static Widget body({required Widget widget}) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: AppColor.colorLight,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              child: Image(
                image: AssetImage(AssetImageName.backgroundApp),
                width: Get.width,
                fit: BoxFit.cover,
              )),
          Positioned(
              bottom: AppDataGlobal.safeBottom + 60,
              child: SizedBox(
                width: Get.width,
                child: Center(
                  child: SizedBox(
                    width: 560,
                    child: CustomText.textInter(
                        maxLine: 2,
                        textAlign: TextAlign.center,
                        text:
                            'Hệ thống thanh toán viện phí thông minh được xây dựng bởi HDBank',
                        style: TextAppStyle.description()),
                  ),
                ),
              )),
          widget
        ],
      ),
    );
  }
}
