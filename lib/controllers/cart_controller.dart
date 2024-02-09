import 'package:food_app_part1/data/repository/cart_repo.dart';
import 'package:food_app_part1/modal/cart_modal.dart';
import 'package:food_app_part1/modal/products_modal.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductsModel product, int quantity) {
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
    } else {
      _items.putIfAbsent(product.id!, () {
        Get.snackbar("Cart Adding",
            "Adding Item to the cart id" + product.id!.toString() + "quantity");
        return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
    }
  }

  bool existInCart(ProductsModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  getQuantity(ProductsModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}
