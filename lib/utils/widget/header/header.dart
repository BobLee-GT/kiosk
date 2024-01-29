
import 'package:flutter/cupertino.dart';

import '../../common/asset/image.dart';

class HeaderCommon {
  static Widget baseHeader(){
    return Image(image: AssetImage(AssetImageName.headerApp));
  }
}