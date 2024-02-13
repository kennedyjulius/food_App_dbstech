import 'dart:convert';

class CartModel {
  int? id;
  String? name;
  int? quantity;
  int? price;
  bool? isExist;
  String? img;
  String? time;

  CartModel({
    this.id,
    this.name,
    this.quantity,
    this.price,
    this.isExist,
    this.img,
    this.time,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      name: json['name'],
      time: json['time'],
      price: json['price'],
      quantity: json['quantity'],
      img: json['img'],
      isExist: json['isExist'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'time': time,
      'price': price,
      'quantity': quantity,
      'img': img,
      'isExist': isExist,
    };
  }
}
