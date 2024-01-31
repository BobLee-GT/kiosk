import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import 'package:medipay/utils/common/data.dart';
import 'resource/config/config_environment.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  AppDataGlobal.isFullScreen.value = true;

  await FullScreenWindow.setFullScreen(AppDataGlobal.isFullScreen.value);

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

  //Custom error screen
  // ErrorWidget.builder = (details) {
  //   return ErrorMainWidget('${details.exception}');
  // };
  //==========

  // For dev
  await EnvConfiguration.initConfig(environment: 'dev');
  // For product
  // await EnvConfiguration.initConfig(environment: 'prod');
  //For uat
  // await EnvConfiguration.initConfig(environment: 'uat');
  runApp(const App());
  configLoading();
}
