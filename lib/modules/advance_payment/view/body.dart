part of 'advance_payment_screen.dart';

extension BodyCustom on AdvancePaymentScreen {
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
            spaceVertical(height: 40),
            _title(),
            spaceVertical(height: 20),
            controller.isQRCode ? _qrCode() : cardPOS(),
            spaceVertical(height: 20),
            _infoPayment(),
          ],
        ),
      ),
    ));
  }

  Widget _title() {
    return Row(
      children: [
        InkWell(
            onTap: Get.back, child: SvgPicture.asset(AssetSVGName.arrowLeft)),
        spaceHorizontal(width: 20),
        CustomText.textInter(
            text: 'Thực hiện tạm ứng',
            maxLine: 1,
            textAlign: TextAlign.center,
            style: TextAppStyle.h1()),
      ],
    );
  }

  Widget _infoPayment() {
    return Container(
      width: 554,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
          color: AppColor.colorLight,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFDEE5FF), width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.textInter(
              text: 'Thông tin phiếu thu', style: TextAppStyle.h2()),
          spaceVertical(height: 20),
          DottedLine(dashColor: AppColor.colorGreyscale300),
          spaceVertical(height: 20),
          _rowText(title: 'Chuyên khoa', content: 'Phục hồi chức năng'),
          spaceVertical(height: 20),
          DottedLine(dashColor: AppColor.colorGreyscale300),
          spaceVertical(height: 20),
          _rowText(
              title: 'Số tiền tạm ứng',
              content: '4.000.000 đ',
              colorText: AppColor.colorUnknown6),
        ],
      ),
    );
  }

  Widget _rowText({
    required String title,
    required String content,
    Color? colorText,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomText.textInter(text: title, style: TextAppStyle.labelRegular()),
        Expanded(
            child: CustomText.textInter(
                text: content,
                textAlign: TextAlign.end,
                style: TextAppStyle.labelBold().copyWith(color: colorText))),
      ],
    );
  }
}
