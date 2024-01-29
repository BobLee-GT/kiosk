part of 'result_register_screen.dart';

extension BodyCustom on ResultRegisterScreen {
  Widget _body() {
    return BodyCommon.body(
        widget: Center(
      child: SizedBox(
        width: 554,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            spaceHorizontal(width: Get.width),
            spaceVertical(height: 60),
            _title(),
            spaceVertical(height: 60),
            controller.isSuccess ? _statusSuccess() : _statusFail(),
          ],
        ),
      ),
    ));
  }

  Widget _title() {
    return SizedBox(
      width: Get.width,
      child: CustomText.textInter(
          text: 'Thông báo',
          maxLine: 1,
          textAlign: TextAlign.center,
          style: TextAppStyle.h1()),
    );
  }

  Widget _statusFail() {
    return Column(
      children: [
        Image(image: AssetImage(AssetImageName.fail), width: 160, height: 160),
        spaceVertical(height: 40),
        CustomText.textInter(
            text:
                'Mở tài khoản thất bại, do xác thực khuôn mặt không thành công',
            maxLine: 3,
            textAlign: TextAlign.center,
            style: TextAppStyle.description()),
        spaceVertical(height: 40),
        _listButton(
          titleButtonTop: 'Xác thực lại',
          onTapButtonTop: () => Get.offAllNamed(Routes.LOGIN),
        ),
      ],
    );
  }

  Widget _statusSuccess() {
    return Column(
      children: [
        Image(
            image: AssetImage(AssetImageName.success), width: 160, height: 160),
        spaceVertical(height: 40),
        CustomText.textInter(
            text:
                'Mở tài khoản thành công, bạn có thể sử dụng tiện ích từ MediPay',
            maxLine: 3,
            textAlign: TextAlign.center,
            style: TextAppStyle.description()),
        spaceVertical(height: 40),
        _listButton(
          titleButtonTop: 'Sử dụng dịch vụ',
          onTapButtonTop: () => Get.offAllNamed(Routes.HOME),
        ),
      ],
    );
  }

  Widget _listButton({
    required String titleButtonTop,
    Function()? onTapButtonTop,
  }) {
    return Column(
      children: [
        CustomButton.commonButton(title: titleButtonTop, onTap: onTapButtonTop),
        spaceVertical(height: 40),
        CustomButton.commonButton(
            title: 'Thoát',
            onTap: () {
              AppDataGlobal.dataCCCDScan.value = CccdDataModel(eidNumber: '');
              Get.offAllNamed(Routes.LOGIN);
            },
            borderColor: AppColor.colorUnknown1,
            titleColor: AppColor.colorUnknown1,
            colorFilter:
                ColorFilter.mode(AppColor.colorLight, BlendMode.clear)),
      ],
    );
  }
}
