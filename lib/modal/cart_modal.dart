// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartModel {
  int? id;
  String? name;
  int? quantity;
  int? price;
  late bool isExist;
  String? img;
  String? time;

  CartModel({
    this.id,
    this.name,
    this.quantity,
    this.price,
    required this.isExist,
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
    isExist = json['isExit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['time'] = time;
    data['price'] = price;
    data['quantity'] = quantity;
    data['img'] = img;
    data['isExit'] = isExist;
    return data;
  }

  CartModel copyWith({
    int? id,
    String? name,
    int? quantity,
    int? price,
    bool? isExit,
    String? img,
    String? time,
  }) {
    return CartModel(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      isExist: isExit ?? this.isExist,
      img: img ?? this.img,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'isExist': isExist,
      'img': img,
      'time': time,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      price: map['price'] != null ? map['price'] as int : null,
      isExist: map['isExist'] as bool,
      img: map['img'] != null ? map['img'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(id: $id, name: $name, quantity: $quantity, price: $price, isExist: $isExist, img: $img, time: $time)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.quantity == quantity &&
        other.price == price &&
        other.isExist == isExist &&
        other.img == img &&
        other.time == time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        isExist.hashCode ^
        img.hashCode ^
        time.hashCode;
  }
}
