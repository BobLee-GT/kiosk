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
            // child: QrImageView(
            //   data:
            //   '0002010102111531397007040052044600000204147320138520010A000000727012200069704230108tult18030208QRIBFTTA5204513753037045802VN5911LE THANH TU6006Ha Noi6304C649 ',
            //   version: QrVersions.auto,
            //   eyeStyle: QrEyeStyle(
            //     color: AppColor.colorDark,
            //     eyeShape: QrEyeShape.circle,
            //   ),
            // ),
            child: imageFromBase64String(base64: 'iVBORw0KGgoAAAANSUhEUgAAAQAAAAEAAQMAAABmvDolAAAABlBMVEX///8AAABVwtN+AAADD0lEQVR42uyZMW7sPAyEx1ChUjd4usiDfa0UBixARa5lwxfR3kClC8HzY+TsboL/tdmwCNt8RWhxyCEXv/Eb9iKQbCMc68JHYIwkDztAAuYxtFiBCvgWfYNfI4DXAe+s88QGLKW6QhYg+jV6VmPAwPYnZIZcDkS44k+DwBh4Yy56ehZMpDVA9TCQZ8hkwoHIXV/7a8H8NNCFE/KtzlGfeo5+L8f/lPWzwD2G6hgS2ODbP1vRNwIhTbxeGTGQhyMcj6H47dFhDADvZ0hDXU58ZHH/kissARvbVB2rKyEXuCLmBKZqB8DbwP616xyZom+RTfIRYwYIacQ8VVfQE/GZcAUDj+lRMAaA9zWkQVn0ttPrQaPZr/csXgJg2XgxTsLxLJ6FWzUEpBGY2PTWIVPmYZe6P7UgAwBXLGT6031OZItK5PxUkwYALPqmIUH+IXXzsIKkfwwUE4CcWF1u1VHqzvR77+5ngB0AAzNlF2eEBrIcfyOmZ9G+AAiHfJX+VUdZhUyu8gbPgWIAgGfFGFKsSwkJx1L0pxH+kaYFAFOdR7jSy1LmX87/jH4Nhx1gURZYzsCexaw2rixI2AHeehuXfCTqw1HWWsLBYQboTmyUvlqsjj6pmXMFv9jF7wX03MumbS5/2AO/F4zgVg0Bfg15I0tgqY5YZGa60bq3QRPAeXWe68UPV7hGmZzzLhwDgGxYGuFudemmOqsFSePPO8zPA3iTwNXDc6kL1Scv1YwwBPgV7gy5XDOxO4dyDPQb8TLgsgcY6hzVZLoh5Cl1GwLepo9encC+b8LJ/D9XdwsABknG3XqfLFrldvo1PvdNC0Cfer0e4rVJdTdY/GPiGABCuvzDjakPu6xNE31LhhmgxyiBt6iSyEVZnJ/8w/cD/ao2yQr2I6rs/d7vk9vns9tPA/1mDqdp0o0WgHhZVkNAv5lXd7uMFhu4l+u5DQJMWqPkH+6ihy3gWvckHCyqVY2ep580AKS+imqNYkWUr54KhvL1sP/NwPV7FvqJY5FlPf6Cm2Y0zAC/8RuvjP8CAAD//5egXwQo+XJRAAAAAElFTkSuQmCC'),
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