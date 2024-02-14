// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/app_column.dart';
import 'package:food_app_part1/Widgets/app_icon.dart';
import 'package:food_app_part1/Widgets/expandable_text_widget.dart';
import 'package:food_app_part1/controllers/cart_controller.dart';
import 'package:food_app_part1/controllers/popular_product_controller.dart';
import 'package:food_app_part1/routes/routes_helper.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/big_text.dart';



class PopularFoodDetail extends StatelessWidget {
  int pageId;
  final String page;
   PopularFoodDetail({Key? key ,required this.pageId,required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product= Get.find<PopularProductController>().popularProductList[pageId];
      Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                        )
                    )
                ),

              ),
              ),
          Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      if(page=="cartpage"){
                        Get.toNamed(RouteHelper.getCartPage());
                      }else{
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                      child: AppIcon(icon: Icons.arrow_back_ios, iconsize: Dimensions.iconSize24,
                      )
                      ),
                  GetBuilder<PopularProductController>(builder: (controller){
                    return GestureDetector(
                      onTap: (){
                        if(controller.totalItems>=1)
                        Get.toNamed(RouteHelper.getCartPage()
                        );
                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined, iconsize: Dimensions.iconSize24,),
                          controller.totalItems>=1?
                          Positioned(
                            right:0,top:0,

                                  child: AppIcon(icon: Icons.circle,size: 20,iconColor: Colors.transparent,backgroundColor: AppColors.mainColor, iconsize: Dimensions.iconSize24,)):
                          Container(),
                          Get.find<PopularProductController>().totalItems>=1?
                          Positioned(
                              right:3,top:3,
                              child: BigText(text:Get.find<PopularProductController>().totalItems.toString(),
                                  size:12,color: Colors.white,
                              ),
                          ):
                          Container()
                        ],
                      ),
                    );
                  })
                ],

              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0 ,
              top: 320,
              child: Container(
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      color: Colors.white
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: product.name!),
                      SizedBox(height: Dimensions.height20,),
                      BigText(text: 'Brief summary'),
                      SizedBox(height: Dimensions.height20,),
                      Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text:product.description!)))
                    ],
                  ),

              ),
              ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
          height: 120,
          padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius30),
                  topRight: Radius.circular(Dimensions.radius30)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.width10,right: Dimensions.width10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(Icons.remove,color: AppColors.signColor,
                      ),
                      ),
                    SizedBox(width: Dimensions.width10,),
                    BigText(text: popularProduct.InCartItems.toString()),
                    SizedBox(width: Dimensions.width10,),
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add,color: AppColors.signColor,)
                        ),

                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  popularProduct.addItem(product);
               },
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),

                      child: BigText(text: 'Ksh ${product.price!} | Add to cart',color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.mainColor
                  ),
                ),
              )
            ],
          ),
        );
      }
      ),
    );
  }
}