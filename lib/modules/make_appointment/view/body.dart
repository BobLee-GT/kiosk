part of 'make_appointment_screen.dart';

extension BodyCustom1 on MakeAppointmentScreen {
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
            spaceVertical(height: 40),
            _cardInfo(),
            spaceVertical(height: 40),
            _cardPayment(
                onTap: controller.onTapCardPOS,
                svgIcon: AssetSVGName.cardPOS,
                title: 'Quẹt thẻ ATM/Master Card/Visa,...'),
            spaceVertical(height: 20),
            _cardPayment(
                onTap: controller.onTapQRCode,
                svgIcon: AssetSVGName.scanBarcode,
                title: 'Quét mã QR ngân hàng'),
            spaceVertical(height: 40),
            _tip(),
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
            text: 'Đăng ký khám bệnh',
            maxLine: 1,
            textAlign: TextAlign.center,
            style: TextAppStyle.h1()),
      ],
    );
  }

  Widget _cardInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
          color: AppColor.colorLight,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColor.colorPrimary200, width: 1)),
      child: Column(
        children: [
          _infoUser(),
          spaceVertical(height: 20),
        ],
      ),
    );
  }

  Widget _cardPayment({
    required String svgIcon,
    required String title,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          decoration: BoxDecoration(
              color: AppColor.colorLight,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColor.colorPrimary200, width: 1)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.textInter(
                        text: 'Tạm ứng với',
                        style: TextAppStyle.labelRegular()
                            .copyWith(color: AppColor.colorNeutral400)),
                    spaceVertical(height: 4),
                    Row(
                      children: [
                        SvgPicture.asset(svgIcon),
                        spaceHorizontal(width: 12),
                        CustomText.textInter(
                            text: title, style: TextAppStyle.labelBold()),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.colorUnknown7,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(AssetSVGName.arrowRight),
              ),
            ],
          )),
    );
  }

  Widget _tip() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          // color: AppColor.colorUnknown5,
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
              colors: [Color(0xFFFFEFD7), Color(0xFFF9F5F5)])),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            decoration: BoxDecoration(
              color: AppColor.colorLight,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetSVGName.lampCharge,
                  color: AppColor.colorUnknown8,
                ),
                spaceHorizontal(width: 4),
                CustomText.textInter(
                    text: 'Tiết kiệm 50% thời gian khám bệnh',
                    style: TextAppStyle.labelRegular()),
              ],
            ),
          ),
          spaceVertical(height: 20),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text:
                      'Tạm ứng giúp bạn khám một cách xuyên suốt, số tiền còn dư trong tài khoản tạm ứng bạn có thể ',
                  style: TextAppStyle.description(),
                  children: [
                    TextSpan(
                        text: 'rút ra bất kỳ lúc nào',
                        style: TextAppStyle.h2()),
                  ])),
        ],
      ),
    );
  }

  Widget _infoUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHorizontal(width: Get.width),
        CustomText.textInter(
            text: 'Thông tin khám bệnh', style: TextAppStyle.h2()),
        spaceVertical(height: 10),
        _rowText(title: 'Bệnh nhân:', content: AppDataGlobal.dataCCCDScan.value.fullName ?? ''),
        spaceVertical(height: 10),
        _rowText(title: 'Chuyên khoa:', content: 'Phục hồi chức năng'),
        spaceVertical(height: 10),
        _rowText(title: 'Phòng khám:', content: 'P01'),
        spaceVertical(height: 10),
        _rowText(title: 'Số thứ tự:', content: '01'),
        spaceVertical(height: 20),
        DottedLine(dashColor: AppColor.colorGreyscale300),
        spaceVertical(height: 20),
        _rowText(
            title: 'Số tiền tạm ứng:',
            content: '4.000.000 đ',
            colorText: AppColor.colorUnknown6),
      ],
    );
  }

  Widget _rowText(
      {required String title, required String content, Color? colorText}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomText.textInter(text: title, style: TextAppStyle.labelRegular()),
        Expanded(
            child: CustomText.textInter(
                text: content,
                maxLine: 3,
                textAlign: TextAlign.end,
                style: TextAppStyle.labelBold().copyWith(color: colorText))),
      ],
    );
  }
}
