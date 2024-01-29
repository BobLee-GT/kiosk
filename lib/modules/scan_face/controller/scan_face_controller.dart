import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medipay/modules/scan_face/view/win_cam.dart';

import '../../../utils/call_api/upload/call_api_upload.dart';

class ScanFaceController extends GetxController {
  CameraController? controllerCamera;
  RxBool isTakePicture = false.obs;
  RxBool isTurnOnCamera = false.obs;

  Rx<XFile?> imageFace = Rx<XFile?>(null);

  RxString cameraInfo = 'Unknown'.obs;
  RxList<CameraDescription> cameras = RxList.empty(growable: true);
  RxInt cameraIndex = 0.obs;

  RxInt cameraId = (-1).obs;
  Rx<Size>? previewSize;

  @override
  void onInit() {
    handleOpenCamera();
    super.onInit();
  }

  @override
  void dispose() {
    controllerCamera?.dispose();
    super.dispose();
  }

  /// ********** Camera on desktop **********
  ///
  /// Fetches list of available cameras from camera_windows plugin.
  Future<void> _fetchCameras() async {
    if (!Platform.isWindows) return;

    String cameraInf = '';
    List<CameraDescription> _cameras = <CameraDescription>[];

    int cameraInx = 0;
    try {
      _cameras = await CameraPlatform.instance.availableCameras();
      if (cameras.isEmpty) {
        cameraInf = 'No available cameras';
      } else {
        cameraInx = cameraIndex.value % _cameras.length;
        cameraInf = 'Found camera: ${_cameras[cameraIndex.value].name}';
      }
    } on PlatformException catch (e) {
      cameraInf = 'Failed to get cameras: ${e.code}: ${e.message}';
    }

    cameraIndex.value = cameraInx;
    cameras.value = _cameras;
    cameraInfo.value = cameraInf;

    await _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    if (cameras.isEmpty) {
      return;
    }

    int _cameraId = -1;
    try {
      final int cameraInd = cameraIndex.value % cameras.length;
      final CameraDescription camera = cameras[cameraIndex.value];

      _cameraId = await CameraPlatform.instance.createCamera(
        camera,
        ResolutionPreset.max,
        enableAudio: false,
      );

      // unawaited(_errorStreamSubscription?.cancel());
      // _errorStreamSubscription = CameraPlatform.instance
      //     .onCameraError(cameraId)
      //     .listen(_onCameraError);

      // unawaited(_cameraClosingStreamSubscription?.cancel());
      // _cameraClosingStreamSubscription = CameraPlatform.instance
      //     .onCameraClosing(cameraId)
      //     .listen(_onCameraClosing);

      final Future<CameraInitializedEvent> initialized =
          CameraPlatform.instance.onCameraInitialized(_cameraId).first;

      await CameraPlatform.instance.initializeCamera(
        _cameraId,
      );

      final CameraInitializedEvent event = await initialized;
      previewSize?.value = Size(
        event.previewWidth,
        event.previewHeight,
      );

      isTurnOnCamera.value = true;

      cameraId.value = _cameraId;
      cameraIndex.value = cameraInd;
      cameraInfo.value = 'Capturing camera: ${camera.name}';
    } catch (e) {
      print('********* Error Camera: $e');
    }
  }

  /// ********** ********** **********

  /// Camera on mobile
  void handleOpenCamera() async {
    if (Platform.isWindows) {
      _fetchCameras();
      return;
    }

    List<CameraDescription> _cameras = await availableCameras();
    controllerCamera = CameraController(_cameras[0], ResolutionPreset.max);
    controllerCamera?.initialize().then((value) {
      isTurnOnCamera.value = true;
    });
  }

  void onTapTakePicture() async {
    if (isTakePicture.isTrue) {
      isTakePicture.value = false;
      imageFace.value = null;
      return;
    }

    isTakePicture.value = true;

    if (Platform.isWindows) {
      imageFace.value = await CameraPlatform.instance.takePicture(cameraId.value);
      return;
    }

    imageFace.value = await controllerCamera?.takePicture();
  }

  void onTapConfirm() async {
    // if (imageFace.value?.path == null) return;
    //
    // await EasyLoading.show();
    // String imageLink = await uploadImageGetLink();
    //
    // if (imageLink == '') {
    //   await EasyLoading.dismiss();
    //   return;
    // }
    //
    // /// Xử lý gửi thông tin đi
    // bool statusVerify = await CallAPICCCD.faceVerify(
    //     faceLink: imageLink,
    //     transactionId: AppDataGlobal.dataCCCDScan.value.transactionId ?? '');
    //
    // Get.offAllNamed(Routes.REGISTERRESULT,
    //     arguments: {"isSuccess": statusVerify});
    // // Get.offAllNamed(Routes.REGISTERRESULT, arguments: {"isSuccess": true});
    // await EasyLoading.dismiss();
  }

  Future<String> uploadImageGetLink() async {
    if (imageFace.value?.path == null) return '';
    File file = File(imageFace.value!.path);
    String imageUrl = await CallAPIUpload.uploadImage(file: file);

    return imageUrl;
  }
}
