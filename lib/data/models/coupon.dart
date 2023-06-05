// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:grocery/data/models/coupon_item.dart';

class Coupon {
  int? id;
  final String fromDate;
  final String endDate;
  final String couponType;
  final int discount;
  final int pricePointAccept;
  final int quantity;
  final String description;
  final String thumbnail;
  final List<CouponItem> couponItemList;
  Coupon({
    this.id,
    required this.fromDate,
    required this.endDate,
    required this.couponType,
    required this.discount,
    required this.pricePointAccept,
    required this.quantity,
    required this.description,
    required this.thumbnail,
    required this.couponItemList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fromDate': fromDate,
      'endDate': endDate,
      'couponType': couponType,
      'discount': discount,
      'pricePointAccept': pricePointAccept,
      'quantity': quantity,
      'description': description,
      'thumnail': thumbnail,
      'couponItemList': couponItemList.map((x) => x.toMap()).toList(),
    };
  }

  factory Coupon.fromMap(Map<String, dynamic> map) {
    return Coupon(
      id: map['id'] != null ? map['id'] as int : null,
      fromDate: map['fromDate'] as String,
      endDate: map['endDate'] as String,
      couponType: map['couponType'] as String,
      discount: map['discount'] as int,
      pricePointAccept: map['pricePointAccept'],
      quantity: map['quantity'] as int,
      description: map['description'] as String,
      thumbnail: map['thumbnail'] as String,
      couponItemList: List<CouponItem>.from(
        (map['couponItemList'] as List<dynamic>).map<CouponItem>(
          (x) => CouponItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Coupon.fromJson(String source) =>
      Coupon.fromMap(json.decode(source) as Map<String, dynamic>);
}
