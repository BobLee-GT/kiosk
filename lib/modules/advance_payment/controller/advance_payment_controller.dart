import 'package:get/get.dart';
import 'package:medipay/routes/app_pages.dart';

class AdvancePaymentController extends GetxController {
  bool isQRCode = Get.arguments['isQRCode'];

  void onExcutePaymentCardPOS() async {
    await Future.delayed(const Duration(seconds: 10));
    Get.offAllNamed(Routes.PAYMENTRESULT, arguments: {"isSuccess": true});
  }

  void onExcutePaymentQRCode() {
    Get.offAllNamed(Routes.PAYMENTRESULT, arguments: {"isSuccess": true});
  }
}
