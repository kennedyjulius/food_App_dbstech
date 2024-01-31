import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/app_icon.dart';
import 'package:food_app_part1/Widgets/big_text.dart';
import 'package:food_app_part1/Widgets/expandable_text_widget.dart';
import 'package:food_app_part1/Widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RecommendedFoodDetail extends StatefulWidget {
  const RecommendedFoodDetail({super.key});

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart),
              ],
              ),
            backgroundColor: AppColors.yellowColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/food3.jpeg", width: double.maxFinite,fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(preferredSize: Size.fromHeight(0), child: Container(
              color: Colors.white,
              child: Center(child: BigText(text: "Chinese Side", size: Dimensions.font26,)),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 5, bottom: 10),
            )
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(text: "It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space.It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space.It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space.It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space.It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space.It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space.It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space.It seems like the error is related to the layout of your widgets. The specific issue is that a RenderFlex (a flex container, such as a Column or Row) is overflowing, causing the layout errors. This often happens when the contents of the flex container are too large to fit within the available space."),
                )
              ],
            )
          )
        ],
      ),
    bottomNavigationBar: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: Dimensions.width20*2.5,
            right: Dimensions.width20*2.5,
            top: Dimensions.height10,
            bottom: Dimensions.height10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                iconSize: Dimensions.iconSize24,
                icon: Icons.remove, backgroundColor: AppColors.mainColor,iconColor: Colors.white,),
                // SizedBox(width: Dimensions.width20,),
                BigText(
                  text: "\$ 12.88 " +" X " + " 0 ",
                  color: AppColors.mainBlackColor, size: Dimensions.font26,
                ),
                // SizedBox(width: Dimensions.width20,),
              AppIcon(
                iconSize: Dimensions.iconSize24,
                icon: Icons.add, backgroundColor: AppColors.mainColor,iconColor: Colors.white,),
            ],
          ),
        ),
      Container(
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
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.snackbar(
                            "Successful clicked", "remove button clicked");
                      },
                      icon: Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      )),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.snackbar("Successful clicked", "Add Button clicked");
                      },
                      icon: Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      )
                      ),
                ],
              ),
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
      ],
    ),
    );
  }
}