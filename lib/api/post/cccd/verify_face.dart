import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medipay/utils/common/data.dart';

import '../../../model/cccd/verify_face.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class VerifyFaceAPI {
  static Future<VerifyFaceModel?> post(
      {required String faceLink, required String transactionId}) async {
    try {
      var response = await DioClient(Dio()).post(SubAPI.verifyCCCD, data: {
        "kioskSeriNo": AppDataGlobal.kioskSeriNo,
        "transactionId": transactionId,
        "faceCaptureUrl": faceLink
      });

      if (kDebugMode) {
        print(
            '******** Status Call API VerifyFaceAPI: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return verifyFaceModelFromJson(jsonEncode(response.data));
      }

      return VerifyFaceModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API VerifyFaceAPI: $e');
      }

      return VerifyFaceModel();
    }
  }
}
