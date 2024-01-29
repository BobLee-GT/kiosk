import 'package:get/get.dart';
import 'package:medipay/modules/advance_payment/binding/advance_payment_binding.dart';
import 'package:medipay/modules/advance_payment/view/advance_payment_screen.dart';
import 'package:medipay/modules/home/binding/home_binding.dart';
import 'package:medipay/modules/home/view/home_screen.dart';
import 'package:medipay/modules/info/view/info_screen.dart';
import 'package:medipay/modules/make_appointment/binding/make_appointment_binding.dart';
import 'package:medipay/modules/make_appointment/view/make_appointment_screen.dart';
import 'package:medipay/modules/register/binding/register_binding.dart';
import 'package:medipay/modules/register/view/register_screen.dart';
import 'package:medipay/modules/result_payment/binding/result_payment_binding.dart';
import 'package:medipay/modules/result_payment/view/result_payment_screen.dart';
import 'package:medipay/modules/result_register/binding/result_register_binding.dart';
import 'package:medipay/modules/result_register/view/result_register_screen.dart';
import 'package:medipay/modules/scan_card/binding/scan_card_binding.dart';
import 'package:medipay/modules/scan_card/view/scan_card_screen.dart';
import 'package:medipay/modules/scan_face/binding/scan_face_binding.dart';
import 'package:medipay/modules/scan_face/view/scan_face_screen.dart';

import '../modules/info/binding/info_binding.dart';
import '../modules/login/binding/login_binding.dart';
import '../modules/login/view/login_screen.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_screen.dart';

part 'app_routes.dart';

final routePages = [
  GetPage(
    name: Routes.SPLASH,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.LOGIN,
    page: () => LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: Routes.SCANID,
    page: () => ScanCardScreen(),
    binding: ScanCardBinding(),
  ),
  GetPage(
    name: Routes.REGISTER,
    page: () => RegisterScreen(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: Routes.INFO,
    page: () => InfoScreen(),
    binding: InfoBinding(),
  ),
  GetPage(
    name: Routes.SCANFACE,
    page: () => ScanFaceScreen(),
    binding: ScanFaceBinding(),
  ),
  GetPage(
    name: Routes.REGISTERRESULT,
    page: () => ResultRegisterScreen(),
    binding: ResultRegisterBinding(),
  ),
  GetPage(
    name: Routes.PAYMENTRESULT,
    page: () => ResultPaymentScreen(),
    binding: ResultPaymentBinding(),
  ),
  GetPage(
    name: Routes.HOME,
    page: () => HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.ADVANCEPAYMENT,
    page: () => AdvancePaymentScreen(),
    binding: AdvancePaymentBinding(),
  ),
  GetPage(
    name: Routes.MAKEAPPOINTMENT,
    page: () => MakeAppointmentScreen(),
    binding: MakeAppointmentBinding(),
  ),
];
