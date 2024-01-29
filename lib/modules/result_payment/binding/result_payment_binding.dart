
import 'package:get/get.dart';

import '../controller/result_payment_controller.dart';

class ResultPaymentBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<ResultPaymentController>(() => ResultPaymentController());
  }

}