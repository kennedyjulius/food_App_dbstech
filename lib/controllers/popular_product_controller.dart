import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/data/repository/popular_product_repo.dart';
import 'package:food_app_part1/modal/products_modal.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get InCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    try {
      Response response = await popularProductRepo.getPopularProductList();
      if (response.statusCode == 200) {
        //print("got products");
        _popularProductList = [];
        _popularProductList
            .addAll(Product.fromJson(response.body).products as Iterable);
        //print(_popularProductList);
        _isLoaded = true;
        update();
      } else {
        // Handle error if needed
      }
    } catch (error) {
      // Handle exception if needed
    }
  }

//another method
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        "Item Count",
        "You cant reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        "Item Count",
        "You cant add more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else
      quantity;
  }

  void initProduct() {
    _quantity = 0;
    _inCartItems = 0;
    //if exist
    //get from storage _inCartItems = 3
  }
}
