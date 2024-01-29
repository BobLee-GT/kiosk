part of 'scan_face_screen.dart';

extension BodyCutstom on ScanFaceScreen {
  Widget _body() {
    return BodyCommon.body(
        widget: Center(
      child: SizedBox(
        width: 840,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            spaceHorizontal(width: Get.width),
            spaceVertical(height: 60),
            _title(),
            spaceVertical(height: 40),
            _image(),
            spaceVertical(height: 40),
            _btnConfirm(),
          ],
        ),
      ),
    ));
  }

  Widget _title() {
    return SizedBox(
      width: 554,
      child: Row(
        children: [
          InkWell(
              onTap: Get.back, child: SvgPicture.asset(AssetSVGName.arrowLeft)),
          spaceHorizontal(width: 20),
          CustomText.textInter(
              text: 'Xác thực khuôn mặt',
              maxLine: 1,
              textAlign: TextAlign.center,
              style: TextAppStyle.h1()),
        ],
      ),
    );
  }

  Widget _image() {
    return Stack(
      children: [
        SizedBox(
          width: 840,
          height: 844,
          child: controller.isTurnOnCamera.isFalse

              /// Dùng để chạy lần đầy (init camera)
              ? const SizedBox()
              : controller.isTakePicture.isFalse

                  /// Dùng để kiểm tra user có chụp ảnh hay chưa
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(44),
                      child: Platform.isWindows ? CameraPlatform.instance.buildPreview(controller.cameraId.value) : CameraPreview(controller.controllerCamera!))
                  : controller.imageFace.value?.path == null

                      /// Dùng để kiểm tra anh chụp có bị null đường dẫn không
                      ? const SizedBox()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(44),
                          child: Image.file(
                              File(controller.imageFace.value!.path),
                              fit: BoxFit.cover),
                        ),
        ),
        Positioned(
            bottom: 40,
            left: 335,
            child: GestureDetector(
              onTap: controller.onTapTakePicture,
              child: Container(
                width: 170,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColor.colorDark.withOpacity(0.44),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(AssetSVGName.takePicture),
                    spaceVertical(height: 10),
                    CustomText.textInter(
                        text: controller.isTakePicture.isTrue
                            ? 'Chụp lại'
                            : 'Chụp hình',
                        style: TextAppStyle.h2()
                            .copyWith(color: AppColor.colorLight)),
                  ],
                ),
              ),
            ))
      ],
    );
  }

  Widget _btnConfirm() {
    return CustomButton.commonButton(
        onTap: controller.onTapConfirm,
        width: 554,
        title: 'Xác nhận',
        colorFilter: controller.imageFace.value?.path != null
            ? null
            : ColorFilter.mode(AppColor.colorUnknown2, BlendMode.color));
  }
}
