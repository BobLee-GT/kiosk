import 'package:get/get.dart';
import '../controller/signature_pad_controller.dart';

class SignaturePadBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<SignaturePadController>(() => SignaturePadController());
  }

}