import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'resource/config/config_environment.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

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

  doWhenWindowReady(() {
    var initialSize = const Size(1920, 1080);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });

  configLoading();
}
