import 'package:get/get.dart';
import 'package:medipay/routes/app_pages.dart';
import 'package:medipay/utils/common/data.dart';

class InfoController extends GetxController {
  RxBool isVerify = false.obs;

  RxBool isExistAddress = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void checkAddress() {
    if (AppDataGlobal.dataCCCDScan.value.address?.province == null ||
        AppDataGlobal.dataCCCDScan.value.address?.district == null ||
        AppDataGlobal.dataCCCDScan.value.address?.ward == null ||
        AppDataGlobal.dataCCCDScan.value.address?.address == null) {
      isExistAddress.value = false;
      return;
    }

    isExistAddress.value = true;
  }

  void doTickVerify() {
    isVerify.value = !isVerify.value;
  }

  void onTapRegister() {
    if (isVerify.isFalse) return;

    Get.toNamed(Routes.SCANFACE);
  }
}
