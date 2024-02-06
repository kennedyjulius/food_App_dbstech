import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/app_column.dart';
import 'package:food_app_part1/Widgets/app_icon.dart';
import 'package:food_app_part1/Widgets/big_text.dart';
import 'package:food_app_part1/Widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            //background image
            Positioned(
              top: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: AppIcon(icon: Icons.arrow_back_ios, iconColor: AppColors.mainColor,)),
                  InkWell(
                    onTap: () => print("Cart on next page"),
                    child: AppIcon(icon: Icons.shopping_cart_outlined, iconColor: AppColors.mainColor,)),
                ],
              ),
            ),
            //icon widget
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
            //introduction of food
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 330,
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
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
                      const Center(child: AppColumn(text: "Biriani")),
                      SizedBox(height: Dimensions.height20),
                      const Center(child: BigText(text: "Introduce")),
                      //expandable text widget
                      const ExpandableTextWidget(
                          text:
                              "It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space.It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space.It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space.It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space."
                              ),
                    ],
                  ),
                ),
              ),
            ),
            // expandable text widget
          ],
        ),
      ),
      // bottom containeer
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
            top: Dimensions.height20,
            bottom: Dimensions.height20,
            left: Dimensions.width20,
            right: Dimensions.width20,
          ),
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
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white),
                child: Icon(Icons.favorite, color: AppColors.mainColor,)
              ),
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
                child: BigText(
                  text: "\$10 | Add to cart",
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
