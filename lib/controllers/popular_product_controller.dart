import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/controllers/cart_controller.dart';
import 'package:food_app_part1/data/repository/popular_product_repo.dart';
import 'package:food_app_part1/modal/cart_modal.dart';
import 'package:food_app_part1/modal/products_modal.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo
  popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

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
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Item Count",
        "You cant reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if (_inCartItems + quantity > 20) {
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

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = _cart;
    var exist = false;
    exist = _cart.existInCart(product);
    //if exist
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    //get from storage _inCartItems = 3
    //print("the quantity in the cart is " + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    if (_quantity > 0) {
      _cart.addItem(product, _quantity);

      _quantity = 0;

      _inCartItems = _cart.getQuantity(product);

      _cart.items.forEach((key, value) {
        print("The id is " +
            value.id.toString() +
            "the quantity " +
            value.quantity.toString());
      });

      update();
    }
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
