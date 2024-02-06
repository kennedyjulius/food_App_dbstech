import 'package:flutter/material.dart';
import 'package:food_app_part1/controllers/popular_product_controller.dart';
import 'package:get/get.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/app_icon.dart';
import 'package:food_app_part1/Widgets/big_text.dart';
import 'package:food_app_part1/Widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;

  const PopularFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Positioned(
              top: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: AppColors.mainColor,
                    ),
                  ),
                  InkWell(
                    onTap: () => print("Cart on next page"),
                    child: AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      iconColor: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
            // Background Image Widget
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.foodDetailImageHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/food7.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Introduction of Food
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 330,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const BigText(text: product.name!),
                      SizedBox(height: Dimensions.height20),
                      const BigText(text: "Introduce"),
                      const ExpandableTextWidget(
                        text: "Your expandable text goes here...",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Container
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.all(Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20),
            topRight: Radius.circular(Dimensions.radius20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Icon(
                Icons.favorite,
                color: AppColors.mainColor,
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: BigText(
                text: "\$10 | Add to Cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
