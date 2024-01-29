part of 'result_payment_screen.dart';

extension BodyCustom on ResultPaymentScreen {
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
            controller.isSuccess ? _statusSuccess() : _statusFail()
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: CustomText.textInter(
              text: 'Thanh toán thất bại, vui lòng đến quầy để được hỗ trợ',
              maxLine: 3,
              textAlign: TextAlign.center,
              style: TextAppStyle.description()),
        ),
        spaceVertical(height: 30),
        _infoPayment(),
        spaceVertical(height: 30),
        _listButton(
          titleButtonTop: 'Về trang chủ',
          onTapButtonTop: () => Get.offAllNamed(Routes.HOME),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: CustomText.textInter(
              text:
                  'Thanh toán thành công! Cảm ơn bạn đã sử dụng tiện ích MediPay',
              maxLine: 3,
              textAlign: TextAlign.center,
              style: TextAppStyle.description()),
        ),
        spaceVertical(height: 30),
        _infoPayment(),
        spaceVertical(height: 30),
        _listButton(
          titleButtonTop: 'Về trang chủ',
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
          _rowText(title: 'Tên dịch vụ', content: 'Khám dạ dày'),
          spaceVertical(height: 20),
          _rowText(title: 'Tạm ứng', content: '4.000.000 đ'),
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
