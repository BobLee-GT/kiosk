import 'dart:io';

import 'package:get/get.dart';

import '../../../api/post/upload/upload_image.dart';
import '../../common/asset/svg.dart';
import '../../widget/popup/custom_popup.dart';


class CallAPIUpload {
  static Future<String> uploadImage(
      {required File file}) async {
    var data = await UploadImageAPI.post(file: file);

    if (data.data?.link == '' || data.data?.link == null) {
      CustomPopup.showTextWithImage(Get.context,
          title: data.data == null
              ? 'Ôi! Có lỗi chưa xác định'
              : 'Ôi! Có lỗi xảy ra',
          message: data.message == null
              ? 'Đã xảy ra lỗi trong quá trình xử lý hình ảnh. Vui lòng thử lại'
              : data.message.toString(),
          titleButton: 'know'.tr,
          svgUrl: AssetSVGName.error);
    }

    return data.data?.link ?? '';
  }
}
