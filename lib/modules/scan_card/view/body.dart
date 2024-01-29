part of 'scan_card_screen.dart';

extension BodyCustom on ScanCardScreen {
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
            _animation(),
          ],
        ),
      ),
    ));
  }

  Widget _title() {
    return Row(
      children: [
        InkWell(
            onTap: () {
              controller.cancelToken.cancel();
              Get.back();
            },
            child: SvgPicture.asset(AssetSVGName.arrowLeft)),
        spaceHorizontal(width: 20),
        CustomText.textInter(
            text: 'Thao tác theo hướng dẫn',
            maxLine: 1,
            textAlign: TextAlign.center,
            style: TextAppStyle.h1()),
      ],
    );
  }

  Widget _animation() {
    return Column(
      children: [
        // Image(image: AssetImage(AssetImageName.cardScan), width: 300, height: 300),
        Lottie.asset(AnimationCommon.scanCard, width: 300, height: 300),
        spaceVertical(height: 40),
        CustomText.textInter(
            text: 'Đặt thẻ CCCD vào thiết bị bên dưới',
            style: TextAppStyle.description())
      ],
    );
  }
}
