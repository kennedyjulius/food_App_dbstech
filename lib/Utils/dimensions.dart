import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.85;
  static double pageViewTextContainer = screenHeight / 7.03;
  static double pageView = screenHeight / 2.65;
  //dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.4;
  static double height20 = screenHeight / 42.4;
  static double height45 = screenHeight / 33.4;

  //popular food
  static double foodDetailImageHeight = screenHeight / 2.71;

  //dynamic width padding and margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.4;
  static double width20 = screenHeight / 42.4;
  static double width30 = screenHeight / 28.14;
  static double width45 = screenHeight / 18.14;
//font size
  static double font20 = screenHeight / 42.4;
  static double font26 = screenHeight / 32.6;

  //radius
  static double radius15 = screenHeight / 56.4;
  static double radius20 = screenHeight / 42.4;
  static double radius30 = screenHeight / 28.4;

  //icon Size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.17;

  //List vie size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //bottom height
   static double bottomHeightBar = screenWidth / 7.03;
}
