import 'package:food_app_part1/data/repository/cart_repo.dart';
import 'package:food_app_part1/modal/cart_modal.dart';
import 'package:food_app_part1/modal/products_modal.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  get totalAmount => null;

  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (Value) {
        return CartModel(
          id: Value.id,
          name: Value.name,
          price: Value.price,
          img: Value.img,
          quantity: Value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
    } else {
      _items[product.id!] = CartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        quantity: quantity,
        isExist: true,
        time: DateTime.now().toString(),
      );
    }
  }

  bool existInCart(ProductModel product) {
    return _items.containsKey(product.id);
  }

  int getQuantity(ProductModel product) {
    return _items.containsKey(product.id) ? _items[product.id]!.quantity! : 0;
  }

  int get totalItems {
    return _items.values.fold(0, (total, item) => total + item.quantity!);
  }

  List<CartModel> get getItems {
    return _items.values.toList();
  }
}
