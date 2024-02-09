// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    price = json['price'];
    quantity = json['quantity'];
    img = json['img'];
    isExist = json['isExist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['time'] = time;
    data['price'] = price;
    data['img'] = img;
    data['quantity'] = quantity;
    data['isExist'] = isExist;
    return data;
  }
}
