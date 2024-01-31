part of 'advance_payment_screen.dart';

extension QRCodeCustom on AdvancePaymentScreen{
  Widget _qrCode() {
    return Column(
      children: [
        GestureDetector(
          onTap: controller.onExcutePaymentQRCode,
          child: Container(
            width: 300,
            height: 300,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.colorLight,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                    color: AppColor.colorUnknown4.withOpacity(0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 4))
              ],
            ),
            child: QrImageView(
              data:
              '0002010102111531397007040052044600000204147320138520010A000000727012200069704230108tult18030208QRIBFTTA5204513753037045802VN5911LE THANH TU6006Ha Noi6304C649 ',
              version: QrVersions.auto,
              eyeStyle: QrEyeStyle(
                color: AppColor.colorDark,
                eyeShape: QrEyeShape.circle,
              ),
            ),
          ),
        ),
        spaceVertical(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: CustomText.textInter(
              text: 'Mở ứng dụng Ngân Hàng/Ví Điện Tử để quét mã QR thanh toán',
              style: TextAppStyle.description(),
              textAlign: TextAlign.center,
              maxLine: 2),
        ),
      ],
    );
  }

  Widget imageFromBase64String({String base64 = ''}) {
    return base64 == ''
        ? const SizedBox()
        : Image.memory(
          base64Decode(base64),
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox();
          },
        );
  }
}