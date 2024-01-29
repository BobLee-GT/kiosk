import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:medipay/routes/app_pages.dart';
import 'package:medipay/utils/call_api/cccd.dart';

class ScanCardController extends GetxController {
  CancelToken cancelToken = CancelToken();

  @override
  void onInit() {
    goToNextScreen();
    super.onInit();
  }

  void goToNextScreen() async {
    bool statusScan = await CallAPICCCD.getData(cancelToken: cancelToken);

    if (!statusScan) return;

    Get.toNamed(Routes.REGISTER);
  }
}
