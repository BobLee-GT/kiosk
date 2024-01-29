part of 'register_screen.dart';

extension BodyCustom on RegisterScreen {
  Widget _body() {
    return BodyCommon.body(
        widget: Center(
      child: SingleChildScrollView(
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
              _image(),
              imageFromBase64String(
                  base64: AppDataGlobal.dataCCCDScan.value.faceOnCard ?? ''),
              spaceVertical(height: 40),
              _btnRegister(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _title() {
    return Row(
      children: [
        InkWell(
            onTap: () => Get.offAllNamed(Routes.LOGIN),
            child: SvgPicture.asset(AssetSVGName.arrowLeft)),
        spaceHorizontal(width: 20),
        CustomText.textInter(
            text: 'Thông báo',
            maxLine: 1,
            textAlign: TextAlign.center,
            style: TextAppStyle.h1()),
      ],
    );
  }

  Widget _image() {
    return Column(
      children: [
        Image(
            image: AssetImage(AssetImageName.cardFail),
            width: 300,
            height: 300),
        spaceVertical(height: 40),
        CustomText.textInter(
            text:
                'Hệ thống bệnh viện chưa ghi nhận dữ liệu CCCD của bạn, hãy mở tài khoản để sử dụng tiện ích',
            maxLine: 3,
            textAlign: TextAlign.center,
            style: TextAppStyle.description())
      ],
    );
  }

  Widget imageFromBase64String({String base64 = ''}) {
    return base64 == ''
        ? const SizedBox()
        : Column(
            children: [
              spaceVertical(height: 40),
              Image.memory(
                base64Decode(base64),
                width: 500,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox();
                },
              ),
            ],
          );
  }

  Widget _btnRegister() {
    return CustomButton.commonButton(
      title: 'Đồng ý và mở tài khoản',
      onTap: controller.goToNextScreen,
    );
  }
}
