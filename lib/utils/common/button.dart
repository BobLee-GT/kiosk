import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medipay/utils/common/asset/image.dart';

import '../widget/space/space.dart';
import '../widget/text/montserrat.dart';
import 'color.dart';
import 'data.dart';

class CustomButton {
  static Widget commonButton(
      {required String title,
      Function()? onTap,
      bool disableButton = false,
      double? height,
      double? width,
      Color? backgroundColor,
      Color? borderColor,
      Color? titleColor,
      ColorFilter? colorFilter}) {
    return GestureDetector(
      onTap: disableButton ? null : onTap,
      child: Container(
        height: height ?? 105,
        width: width ?? Get.width,
        decoration: BoxDecoration(
          // color: disableButton
          //     ? AppColor.colorDisableButton
          //     : backgroundColor ?? AppColor.colorButton,
          image: DecorationImage(
              image: AssetImage(AssetImageName.backgroundButton),
              colorFilter: colorFilter),
          border: borderColor != null ? Border.all(color: borderColor, width: 3.74) : null,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Center(
            child: CustomText.textInter(
                text: title,
                maxLine: 1,
                fontWeight: FontWeight.w500,
                fontSize: 28,
                textDecoration: TextDecoration.none,
                colorText: titleColor ?? AppColor.colorLight)),
      ),
    );
  }

  static Widget buttonWithIcon(
      {required String assetSVG,
      Function()? onTap,
      Color? iconColor,
      Color? selectedColor,
      bool isSelect = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelect
                  ? AppColor.colorButton
                  : AppColor.colorGreyBorderButton),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: SvgPicture.asset(
            assetSVG,
            colorFilter: ColorFilter.mode(
                isSelect
                    ? AppColor.colorButton
                    : iconColor ?? AppColor.colorDark,
                BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  static Widget buttonTextWithIcon(
      {required String title,
      required String assetSVG,
      Function()? onTap,
      bool disableButton = false,
      double? height,
      double? width,
      Color? backgroundColor,
      Color? borderColor,
      Color? iconColor,
      Color? titleColor}) {
    return GestureDetector(
      onTap: disableButton ? null : onTap,
      child: Container(
        height: height ?? 56,
        width: width ?? Get.width,
        decoration: BoxDecoration(
          color: disableButton
              ? AppColor.colorDisableButton
              : backgroundColor ?? AppColor.colorButton,
          border: borderColor != null ? Border.all(color: borderColor) : null,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetSVG,
              colorFilter: ColorFilter.mode(
                  iconColor ?? AppColor.colorLight, BlendMode.srcIn),
            ),
            spaceHorizontal(width: 16),
            CustomText.textInter(
                text: title,
                maxLine: 1,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                textDecoration: TextDecoration.none,
                colorText: titleColor ?? AppColor.colorLight),
          ],
        ),
      ),
    );
  }
}
