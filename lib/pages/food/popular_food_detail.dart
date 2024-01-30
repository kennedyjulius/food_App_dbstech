import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/app_column.dart';
import 'package:food_app_part1/Widgets/app_icon.dart';
import 'package:food_app_part1/Widgets/big_text.dart';
import 'package:food_app_part1/Widgets/icon_and_text_widget.dart';
import 'package:food_app_part1/Widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(icon: Icons.arrow_back_ios),
                    AppIcon(icon: Icons.shopping_cart_outlined),
                  ],
                ),
              ),
              Positioned(
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
              Positioned(
                left: 0, 
                right: 0,
                bottom: 0,
                top: Dimensions.foodDetailImageHeight - 30,
                child: Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),
                  
                  ),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: AppColumn(text: "Biriani")),
                      SizedBox(height: Dimensions.height20),
                      Center(child: BigText(text: "Introduce")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
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
      ),
    );
  }
}
