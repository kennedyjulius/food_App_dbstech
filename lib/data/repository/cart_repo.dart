import 'package:food_app_part1/modal/cart_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [

    // void addToCartList(List<CartModel>  cartList){

    // }
  ];
}
