
import 'package:get/get.dart';

import '../controller/result_register_controller.dart';

class ResultRegisterBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ResultRegisterController>(() => ResultRegisterController());
  }

}