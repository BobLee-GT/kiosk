import 'package:get/get.dart';
import 'package:medipay/routes/app_pages.dart';

class MakeAppointmentController extends GetxController {
  void onTapCardPOS() {
    Get.toNamed(Routes.ADVANCEPAYMENT, arguments: {"isQRCode": false});
  }

  void onTapQRCode() {
    Get.toNamed(Routes.ADVANCEPAYMENT, arguments: {"isQRCode": true});
  }
}
