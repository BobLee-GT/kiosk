part of 'home_screen.dart';

extension BodyCustom on HomeScreen {
  Widget _body() {
    return BodyCommon.body(
        widget: Center(
      child: SizedBox(
        width: 840,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            spaceHorizontal(width: Get.width),
            spaceVertical(height: 60),
            _title(),
            spaceVertical(height: 60),
            _mainWidget(),
            spaceVertical(height: 40),
            _rowButtonAdvance(),
          ],
        ),
      ),
    ));
  }

  Widget _title() {
    return SizedBox(
      width: Get.width,
      child: CustomText.textInter(
          text: 'Tiện ích y tế thông minh MediPay',
          maxLine: 1,
          textAlign: TextAlign.center,
          style: TextAppStyle.h1()),
    );
  }

  Widget _mainWidget() {
    return Container(
      width: 840,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44),
        image: DecorationImage(
            image: AssetImage(AssetImageName.backgroundButton01),
            fit: BoxFit.fill),
      ),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        Expanded(child: _balance()),
        _moreFunction(),
      ]),
    );
  }

  Widget _balance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.textInter(
            text: 'Tài khoản tạm ứng',
            style: TextAppStyle.bodyRegular()
                .copyWith(color: AppColor.colorLight)),
        spaceVertical(height: 10),
        CustomText.textInter(
            text: AppDataGlobal.dataCCCDScan.value.fullName ?? '',
            style: TextAppStyle.h2().copyWith(color: AppColor.colorLight)),
        spaceVertical(height: 10),
        CustomText.textInter(
            text: '******** đ',
            style: TextAppStyle.h4().copyWith(color: AppColor.colorLight)),
      ],
    );
  }

  Widget _moreFunction() {
    return Row(
      children: [
        _columnItemFunction(svgImage: AssetSVGName.moneyReceive, title: 'Nạp'),
        _divide(),
        _columnItemFunction(svgImage: AssetSVGName.moneySend, title: 'Rút'),
        _divide(),
        _columnItemFunction(svgImage: AssetSVGName.exit, title: 'Thoát'),
      ],
    );
  }

  Widget _columnItemFunction({
    required String svgImage,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          SvgPicture.asset(svgImage),
          spaceVertical(height: 15),
          CustomText.textInter(
              text: title,
              style:
                  TextAppStyle.labelBold().copyWith(color: AppColor.colorLight))
        ],
      ),
    );
  }

  Widget _divide() {
    return Row(
      children: [
        spaceHorizontal(width: 10),
        Container(
          width: 1,
          height: 48,
          color: AppColor.colorLight.withOpacity(0.24),
        ),
        spaceHorizontal(width: 10),
      ],
    );
  }

  Widget _rowButtonAdvance() {
    return Row(children: [
      _btnAdvance(
          onTap: controller.onTapMakeAppointment,
          svgImage: AssetSVGName.seeDoctor,
          title: 'Đăng ký\nkhám bệnh',
          subText: 'Nhanh gọn',
          colors: [
            const Color(0xFFE1E8FF),
            const Color(0xFFFFFFFF).withOpacity(0),
          ],
          colorsBorder: [
            const Color(0xFFE1E8FF),
            const Color(0xFF2975FF),
          ]),
      spaceHorizontal(width: 20),
      _btnAdvance(
          svgImage: AssetSVGName.myBill,
          title: 'Phiếu thu\ncủa tôi',
          subText: 'Bảo mật thông tin',
          colors: [
            const Color(0xFFC1ECD7),
            const Color(0xFFFFFFFF).withOpacity(0),
          ],
          colorsBorder: [
            const Color(0xFFD2F1E2),
            const Color(0xFF00A656),
          ]),
      spaceHorizontal(width: 20),
      _btnAdvance(
          svgImage: AssetSVGName.hdbank,
          title: 'Mở tài khoản\nHDBank',
          subText: 'Hoàn tiền khám',
          colors: [
            const Color(0xFFFEE4DC),
            const Color(0xFFFFFFFF).withOpacity(0),
          ],
          colorsBorder: [
            const Color(0xFF000000).withOpacity(0),
            const Color(0xFFFC3829),
          ]),
    ]);
  }

  Widget _btnAdvance(
      {required List<Color> colors,
      required List<Color> colorsBorder,
      required String title,
      required String subText,
      required String svgImage,
      Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 840 / 3 - 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            border: GradientBoxBorder(
                gradient: LinearGradient(
                    colors: colorsBorder,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            spaceVertical(height: 32),
            SvgPicture.asset(svgImage),
            spaceVertical(height: 20),
            CustomText.textInter(
                text: title,
                maxLine: 2,
                textAlign: TextAlign.center,
                style: TextAppStyle.h2()),
            spaceVertical(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  color: AppColor.colorLight,
                  borderRadius: BorderRadius.circular(120),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.colorUnknown4.withOpacity(0.12),
                        blurRadius: 12,
                        offset: const Offset(0, 4))
                  ]),
              child: CustomText.textInter(
                  text: subText, style: TextAppStyle.mediumBoldTextStyle()),
            ),
            spaceVertical(height: 32),
          ],
        ),
      ),
    );
  }
}
