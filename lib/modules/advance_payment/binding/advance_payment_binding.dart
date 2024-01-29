
import 'package:get/get.dart';

import '../controller/advance_payment_controller.dart';

class AdvancePaymentBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<AdvancePaymentController>(() => AdvancePaymentController());
  }

}