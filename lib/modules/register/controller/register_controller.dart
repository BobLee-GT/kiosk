
import 'package:get/get.dart';
import 'package:medipay/routes/app_pages.dart';

class RegisterController extends GetxController{

  void goToNextScreen(){
    Get.toNamed(Routes.INFO);
  }
}