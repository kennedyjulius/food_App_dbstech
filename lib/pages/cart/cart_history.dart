import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/app_icon.dart';
import 'package:food_app_part1/controllers/cart_controller.dart';
import 'package:food_app_part1/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHistory extends StatefulWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  State<CartHistory> createState() => _CartHistoryState();
}

class _CartHistoryState extends State<CartHistory> {
  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = {};

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time!)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> itemsPerOrder =
        cartItemsPerOrder.entries.map((e) => e.value).toList();

    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                const BigText(
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
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: itemsPerOrder.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        BigText(text: "05/02/2021"),
                        SizedBox(height: Dimensions.height10/2,),
                        Row(
                          children: List.generate(itemsPerOrder[index], (index) {
                            if (listCounter < getCartHistoryList.length) {
                              listCounter++;
                            }
                            return Container(
                              height: 80,
                              width: 80,
                              margin: const EdgeInsets.all(5),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                      image: NetworkImage(AppConstants.BASE_URL +
                                          AppConstants.UPLOAD_URL +
                                          getCartHistoryList[listCounter - 1]
                                              .img!
                                              )
                                              )
                                              ),
                            );
                          }),
                        ),
                      ],
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
