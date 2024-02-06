part of 'signature_pad_screen.dart';

extension BodyCustom on SignaturePadScreen {
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
              spaceVertical(height: 40),
              _tip(),
              spaceVertical(height: 40),
              _signaturePad(),
              spaceVertical(height: 40),
              _listButton(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _title() {
    return SizedBox(
      width: Get.width,
      child: CustomText.textInter(
          text: 'Ký xác nhận',
          maxLine: 1,
          textAlign: TextAlign.center,
          style: TextAppStyle.h1()),
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
                  text: 'Thực hiện ký tên giúp đảm bảo tính ',
                  style: TextAppStyle.description(),
                  children: [
                    TextSpan(
                        text: 'bảo mật & quyền lợi của bạn ',
                        style: TextAppStyle.h2()),
                    TextSpan(
                        text: 'khi phát sinh tranh chấp',
                        style: TextAppStyle.description()),
                  ])),
        ],
      ),
    );
  }

  Widget _signaturePad() {
    return Container(
      height: 291,
      width: 554,
      // padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetImageName.backgroundSignature)),
        borderRadius: BorderRadius.circular(24),
        // border: Border.all(color: AppColor.colorNeutral400),
      ),
      child: SfSignaturePad(
        key: controller.signaturePadKey,
        minimumStrokeWidth: 4,
        maximumStrokeWidth: 8,
        strokeColor: AppColor.colorDark,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  Widget _listButton() {
    return Column(
      children: [
        CustomButton.commonButton(
          title: 'Xác nhận',
          onTap: () {
            Get.offAllNamed(Routes.PAYMENTRESULT,
                arguments: {"isSuccess": true});
          },
        ),
        spaceVertical(height: 40),
        CustomButton.commonButton(
            title: 'Ký lại',
            onTap: () {},
            borderColor: AppColor.colorUnknown1,
            titleColor: AppColor.colorUnknown1,
            colorFilter:
                ColorFilter.mode(AppColor.colorLight, BlendMode.clear)),
      ],
    );
  }
}
