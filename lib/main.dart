import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import 'resource/config/config_environment.dart';

import 'app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isWindows) FullScreenWindow.setFullScreen(true);
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