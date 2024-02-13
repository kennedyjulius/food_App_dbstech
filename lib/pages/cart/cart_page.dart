import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/app_icon.dart';
import 'package:food_app_part1/Widgets/big_text.dart';
import 'package:food_app_part1/Widgets/small_text.dart';
import 'package:food_app_part1/controllers/cart_controller.dart';
import 'package:food_app_part1/pages/Home/main_food_page.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            top: Dimensions.height20 * 3,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.to(() => MainFoodPage());
                  },
                  child: AppIcon(
                    icon: Icons.home_mini_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),

          // ListView Builder
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 100,
                          width: double.maxFinite,
                          color: Colors.blue,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: Dimensions.height10),
                                width: Dimensions.width20 * 5,
                                height: Dimensions.height20 * 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        cartController.getItems[index].img!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.height10),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: cartController.getItems[index].name!,
                                        color: Colors.black54,
                                      ),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        children: [
                                          BigText(
                                            text: cartController.getItems[index].price.toString(),
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(Dimensions.width20),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(width: Dimensions.height10 / 2),
                                                BigText(text: "0"),
                                                SizedBox(width: Dimensions.width10 / 2),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
