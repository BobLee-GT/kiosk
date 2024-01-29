part of 'info_screen.dart';

extension BodyCustom on InfoScreen {
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
            _cardInfo(),
            spaceVertical(height: 40),
            _checkBoxSavePass(),
            spaceVertical(height: 40),
            _btnRegister(),
          ],
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
            text: 'Tóm tắt thông tin',
            maxLine: 1,
            textAlign: TextAlign.center,
            style: TextAppStyle.h1()),
      ],
    );
  }

  Widget _cardInfo() {
    return Column(
      children: [
        _infoUser(),
        spaceVertical(height: 20),
        _infoUserAddress(),
      ],
    );
  }

  Widget _infoUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHorizontal(width: Get.width),
        CustomText.textInter(
            text: 'Thông tin tùy thân', style: TextAppStyle.h2()),
        spaceVertical(height: 10),
        _rowText(
            title: 'Họ tên:',
            content: AppDataGlobal.dataCCCDScan.value.fullName ?? ''),
        spaceVertical(height: 10),
        _rowText(
            title: 'Ngày sinh:',
            content: AppDataGlobal.dataCCCDScan.value.dateOfBirth ?? ''),
        spaceVertical(height: 10),
        _rowText(
            title: 'Số CMND/CCCD:',
            content: AppDataGlobal.dataCCCDScan.value.eidNumber ?? ''),
        spaceVertical(height: 10),
        _rowText(
            title: 'Ngày cấp:',
            content: AppDataGlobal.dataCCCDScan.value.dateOfIssue ?? ''),
        spaceVertical(height: 10),
        _rowText(
            title: 'Giới tính:',
            content: AppDataGlobal.dataCCCDScan.value.gender ?? ''),
      ],
    );
  }

  Widget _infoUserAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceHorizontal(width: Get.width),
        CustomText.textInter(
            text: 'Địa chỉ theo sổ hộ khẩu', style: TextAppStyle.h2()),
        spaceVertical(height: 10),
        controller.isExistAddress.value
            ? Column(
                children: [
                  _rowText(
                      title: 'Tỉnh/Thành phố:',
                      content:
                          AppDataGlobal.dataCCCDScan.value.address?.province ??
                              ''),
                  spaceVertical(height: 10),
                  _rowText(
                      title: 'Quận/Huyện:',
                      content:
                          AppDataGlobal.dataCCCDScan.value.address?.district ??
                              ''),
                  spaceVertical(height: 10),
                  _rowText(
                      title: 'Phường/Xã:',
                      content:
                          AppDataGlobal.dataCCCDScan.value.address?.ward ?? ''),
                  spaceVertical(height: 10),
                  _rowText(
                      title: 'Số nhà & tên đường:',
                      content:
                          '${AppDataGlobal.dataCCCDScan.value.address?.address ?? ''} ${AppDataGlobal.dataCCCDScan.value.address?.hamlet ?? ''}'),
                ],
              )
            : _rowText(
                title: 'Địa chỉ:',
                content:
                    AppDataGlobal.dataCCCDScan.value.placeOfResidence ?? ''),
        spaceVertical(height: 10),
      ],
    );
  }

  Widget _rowText({
    required String title,
    required String content,
  }) {
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
                style: TextAppStyle.labelBold())),
      ],
    );
  }

  Widget _btnRegister() {
    return CustomButton.commonButton(
        onTap: controller.onTapRegister,
        title: 'Xác nhận và mở tài khoản',
        colorFilter: controller.isVerify.value
            ? null
            : ColorFilter.mode(AppColor.colorUnknown2, BlendMode.color));
  }

  Widget _checkBoxSavePass() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: controller.isVerify.value
                  ? AppColor.colorUnknown1
                  : Colors.white,
              border: Border.all(color: AppColor.colorBlack3, width: 1)),
          child: Checkbox(
            value: controller.isVerify.value,
            checkColor: Colors.white,
            activeColor: Colors.transparent,
            side: MaterialStateBorderSide.resolveWith((states) =>
                const BorderSide(width: 0, color: Colors.transparent)),
            onChanged: (value) {
              controller.doTickVerify();
            },
          ),
        ),
        spaceHorizontal(width: 9),
        Expanded(
          // child: CustomText.textInter(
          //     text:
          //         'Bằng việc mở tài khoản, tôi đồng ý với điều khoản & điều kiện của hệ thống MediPay',
          //     maxLine: 2,
          //     style: TextAppStyle.description()),
          child: RichText(
              text: TextSpan(
                  text: 'Bằng việc mở tài khoản, tôi đồng ý với ',
                  style: TextAppStyle.description(),
                  children: [
                TextSpan(
                    text: 'điều khoản & điều kiện',
                    style: TextAppStyle.description().copyWith(
                        color: AppColor.colorUnknown1,
                        decoration: TextDecoration.underline)),
                TextSpan(
                    text: ' của hệ thống MediPay',
                    style: TextAppStyle.description()),
              ])),
        )
      ],
    );
  }
}
