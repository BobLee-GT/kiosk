part of 'advance_payment_screen.dart';

extension CardPosCustom on AdvancePaymentScreen {
  Widget cardPOS() {
    return Column(
      children: [
        _image(),
        spaceVertical(height: 40),
        _rowTip(),
      ],
    );
  }

  Widget _image() {
    return GestureDetector(
      onTap: controller.onExcutePaymentCardPOS,
      child: Column(
        children: [
          Image(
              image: AssetImage(AssetImageName.cardScan),
              width: 300,
              height: 300),
          spaceVertical(height: 40),
          CustomText.textInter(
              text: 'Thực hiện tạm ứng thông qua\nPOS với hướng dẫn',
              maxLine: 2,
              textAlign: TextAlign.center,
              style: TextAppStyle.description())
        ],
      ),
    );
  }

  Widget _rowTip() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _itemTip(
            imageAsset: AssetImageName.flowCardPos1,
            title: 'Cách 1',
            subTitle: 'Đút thẻ vào khe bên dưới'),
        _itemTip(
            imageAsset: AssetImageName.flowCardPos2,
            title: 'Cách 2',
            subTitle: 'Chạm thẻ vào khu vực có ký hiệu NFC'),
        _itemTip(
            imageAsset: AssetImageName.flowCardPos3,
            title: 'Cách 3',
            subTitle: 'Cà thẻ ở mặt bên')
      ],
    );
  }

  Widget _itemTip(
      {required String imageAsset,
      required String title,
      required String subTitle}) {
    return SizedBox(
      width: 160,
      child: Column(
        children: [
          Image(
            image: AssetImage(imageAsset),
            height: 160,
          ),
          spaceVertical(height: 20),
          CustomText.textInter(text: title, style: TextAppStyle.labelBold()),
          spaceVertical(height: 4),
          CustomText.textInter(
              text: subTitle,
              maxLine: 3,
              textAlign: TextAlign.center,
              style: TextAppStyle.labelRegular()),
        ],
      ),
    );
  }
}
