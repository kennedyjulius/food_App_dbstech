import 'dart:convert';

import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:food_app_part1/modal/cart_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  // Assuming this is where your cart history is stored
  List<CartModel> cartHistoryList = [];

  List<CartModel> getCartHistoryList() {
    print(cartHistoryList.length);
    return cartHistoryList;
  }

  List<CartModel> getCartList() {
    List<String> carts = sharedPreferences.getStringList(AppConstants.CART_LIST) ?? [];
    return carts.map((element) => CartModel.fromJson(jsonDecode(element))).toList();
  }

  void addToCartList(List<CartModel> cartList) {
    final List<String> cartStrings = cartList.map((element) => jsonEncode(element)).toList();
    sharedPreferences.setStringList(AppConstants.CART_LIST, cartStrings);
  }

  void addToCartHistoryList(List<CartModel> getItems) {
    final List<String> cartHistory = getItems.map((item) => jsonEncode(item)).toList();
    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
  }
}
