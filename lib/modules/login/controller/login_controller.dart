import 'package:get/get.dart';
import 'package:medipay/routes/app_pages.dart';

class LoginController extends GetxController {

  void onTapCCCD(){
    Get.toNamed(Routes.SCANID);
  }
}
