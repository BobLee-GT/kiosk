import 'package:get/get.dart';
import 'package:medipay/routes/app_pages.dart';

class AdvancePaymentController extends GetxController {
  bool isQRCode = Get.arguments['isQRCode'];
  RxString awakeInit = ''.obs;

  @override
  void onInit() {
    if(isQRCode != true){
      onExcutePaymentCardPOS();
    }
    super.onInit();
  }

  void onExcutePaymentCardPOS() async {
    await Future.delayed(const Duration(seconds: 10));
    // Get.offAllNamed(Routes.PAYMENTRESULT, arguments: {"isSuccess": true});

    Get.toNamed(Routes.SIGNATUREPAD);
  }

  void onExcutePaymentQRCode() {
    Get.offAllNamed(Routes.PAYMENTRESULT, arguments: {"isSuccess": true});
  }
}
