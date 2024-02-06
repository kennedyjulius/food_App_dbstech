import 'package:flutter/material.dart';
import 'package:food_app_part1/pages/Home/food_page_body.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/big_text.dart';
import 'package:food_app_part1/Widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //showing the header
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height15),
            padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Kenya", color: AppColors.mainColor,),
                      SmallText(text: "Nairobi", color: Colors.black54,),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  Center( 
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor
                      ),
                      child: Icon(Icons.search, color: Colors.white, size: 24,),
                    ),
                  )
                ],
              ),
            ),
          ),
        Expanded(
          child: SingleChildScrollView(
            child: FoodPageBody(),
            )
            ),
        ],
      ),
    );
  }
}