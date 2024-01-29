Map<String, String> urlConnectAPI = {
  "dev": "https://api-dev.gotrust.vn/identityhub/v1/Identity/",
  "prod": "",
  "uat": "",
};

// Main API
String mainURL = '';

// String mainDevUrl =
//     'https://api-beta.shopdi.io/';
// String mainProdUrl = 'https://prod-api.shopdi.com.vn/';
// String mainUATUrl = 'https://api-beta.shopdi.io/';

class SubAPI{
  static String dataCCCD = 'device/reader/chip';

  static String verifyCCCD = 'kiosk/verify/faceCaptureUrl';

  static String uploadImage = '';

}
