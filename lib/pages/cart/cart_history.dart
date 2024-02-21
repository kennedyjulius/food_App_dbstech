import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/app_icon.dart';
import 'package:food_app_part1/controllers/cart_controller.dart';
import 'package:food_app_part1/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHistory extends StatefulWidget {
  const CartHistory({super.key});

  @override
  State<CartHistory> createState() => _CartHistoryState();
}

class _CartHistoryState extends State<CartHistory> {
  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }
    List<int> orderTimes = cartOrderTimeToList();
    for (int x=0; x <cartItemsPerOrder.length; x++){
    for(int y=0; y<cartItemsPerOrder.length; y++){
      //print("My order is"+)
    }
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                  size: 20,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconsize: Dimensions.iconSize24,
                  iconColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20
            ),
            child: ListView(
              children: [
                Text("hi there")
              ],
            ),
          )
        ],
      ),
    );
  }
}
