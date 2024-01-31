part of 'login_screen.dart';

extension BodyCustom on LoginScreen {
  Widget _body() {
    return BodyCommon.body(
        widget: Center(
      child: SizedBox(
        width: 554,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              spaceHorizontal(width: Get.width),
              spaceVertical(height: 60),
              _title(),
              spaceVertical(height: 48),
              _btnVerifyWithCCCD(),
              spaceVertical(height: 20),
              _btnVerifyWithBHYT(),
              spaceVertical(height: 48),
              _moreInfo(
                  svgImage: AssetSVGName.time, title: 'Tiết kiệm thời gian'),
              spaceVertical(height: 20),
              _moreInfo(
                  svgImage: AssetSVGName.security,
                  title: 'Bảo mật thông tin với MediPay'),
              spaceVertical(height: 20),
              _moreInfo(
                  svgImage: AssetSVGName.convenient,
                  title: 'Tiện lợi & dễ sử dụng với mọi đối tượng'),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _title() {
    return CustomText.textInter(
        text: 'Tiện ích y tế thông minh \nMediPay chào mừng bạn!',
        maxLine: 2,
        textAlign: TextAlign.center,
        style: TextAppStyle.h1());
  }

  Widget _btnVerifyWithCCCD() {
    return CustomButton.commonButton(
        title: 'Xác thực Với Căn Cước Công Dân',
        onTap: controller.onTapCCCD,
        colorFilter: ColorFilter.mode(AppColor.colorUnknown3, BlendMode.color));
  }

  Widget _btnVerifyWithBHYT() {
    return CustomButton.commonButton(title: 'Xác thực Với Bảo Hiểm Y Tế');
  }

  Widget _moreInfo({
    required String svgImage,
    required String title,
  }) {
    return Row(
      children: [
       SvgPicture.asset(svgImage),
        spaceHorizontal(width: 20),
        Flexible(
            child: CustomText.textInter(
                text: title, style: TextAppStyle.description()))
      ],
    );
  }
}
