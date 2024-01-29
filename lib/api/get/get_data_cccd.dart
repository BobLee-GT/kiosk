import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medipay/model/cccd/data_cccd.dart';
import 'package:medipay/utils/common/data.dart';

import '../setup_dio/dio_setup.dart';
import '../url.dart';

class CCCDGetDataAPI {
  static Future<CccdModel> get({
    CancelToken? cancelToken
}) async {
    try {
      var response = await DioClient(Dio())
          .get('${SubAPI.dataCCCD}/${AppDataGlobal.kioskSeriNo}', cancelToken: cancelToken);

      if (kDebugMode) {
        print(
            '******** Status Call API CCCD Get Data: ${response.statusCode} ********');
      }
      if(response.statusCode == 0){
        return CccdModel(code: '00', data: CccdDataModel(eidNumber: '-1'));
      }

      if (response.statusCode == 200) {
        return cccdModelFromJson(jsonEncode(response.data));
      }

      return CccdModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API CCCD Get Data: $e');
      }

      return CccdModel();
    }
  }
}
