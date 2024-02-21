import 'dart:convert';

import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:food_app_part1/modal/cart_modal.dart';
import 'package:food_app_part1/modal/products_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  //convert objects to string simply because sharedpreferences only accepts a list of strings
  // Assuming this is where your cart history is stored
  List<CartModel> cartHistoryList = [];


  List<CartModel> getCartHistoryList() {
    return cartHistoryList;
  }

  List<String> cart = [];
  var time = DateTime.now().toString();
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    sharedPreferences.remove(AppConstants.CART_LIST);
    cart = [];
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList());
  }

  List<CartModel> getCartLIst() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }
    List<CartModel> cartList = [];
    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }

  void addToCartHistoryList() {
    for (int i = 0; 1 < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);
  }
}
