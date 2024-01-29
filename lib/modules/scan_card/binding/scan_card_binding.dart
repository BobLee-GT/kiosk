import 'package:get/get.dart';

import '../controller/scan_card_controller.dart';

class ScanCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScanCardController());
  }
}
