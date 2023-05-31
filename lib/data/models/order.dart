// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:grocery/data/models/cart.dart';

class Order {
  String? id;
  String? status;
  double? total;
  final String phoneNum;
  final int addressId;
  final String deliveryDate;
  final String paymentMethod;
  final List<Cart> productList;
  Order({
    this.id,
    this.status,
    this.total,
    required this.phoneNum,
    required this.addressId,
    required this.deliveryDate,
    required this.paymentMethod,
    required this.productList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phoneNum': phoneNum,
      'addressId': addressId,
      'deliveryDate': deliveryDate,
      'paymentMethod': paymentMethod,
      'productList': productList
          .map((x) => {
                'id': x.product.id,
                'quantity': x.quantity,
              })
          .toList(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
        id: map['id'] as String,
        total: map['total'] as double,
        status: map['status'] as String,
        phoneNum: map['phoneNum'] as String,
        addressId: map['addressId'] as int,
        deliveryDate: map['deliveryDate'] as String,
        paymentMethod: map['paymentMethod'] as String,
        productList: []
        // productList: List<Cart>.from(
        //   (map['productList'] as List<int>).map<Cart>(
        //     (x) => Cart.fromMap(x as Map<String, dynamic>),
        //   ),
        // ),
        );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
