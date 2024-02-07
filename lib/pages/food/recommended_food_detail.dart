import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/app_icon.dart';
import 'package:food_app_part1/Widgets/big_text.dart';
import 'package:food_app_part1/Widgets/expandable_text_widget.dart';
import 'package:food_app_part1/controllers/recommended_product_controller.dart';
import 'package:food_app_part1/routes/routes_helper.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>()
        .recommendedProductList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.recommendedFood);
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                AppIcon(icon: Icons.shopping_cart),
              ],
            ),
            backgroundColor: AppColors.yellowColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                fit: BoxFit.cover,
              )
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                color: Colors.white,
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimensions.font26,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20),
              child: ExpandableTextWidget(
                text:
                    product.description!
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.all(Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20),
            topRight: Radius.circular(Dimensions.radius20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: "\$ 12.88 X 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: Dimensions.height20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
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
                        ),
                      ),
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(text: "0"),
                      SizedBox(width: Dimensions.width10 / 2),
                      IconButton(
                        onPressed: () {
                          Get.snackbar(
                              "Successful clicked", "Add Button clicked");
                        },
                        icon: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: BigText(
                    text: "Kshs ${product.price} | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
