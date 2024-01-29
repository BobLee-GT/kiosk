import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'resource/config/config_environment.dart';

import 'app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isWindows) WindowManager.instance.setFullScreen(false);
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