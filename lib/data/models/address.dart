// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  final bool setAsPrimary;
  final int? id;
  final String name;
  final int provinceId;
  final String provinceName;
  final int districtId;
  final String districtName;
  final String wardCode;
  final String wardName;
  final String detail;
  final String phoneNum;

  Address({
    this.id,
    required this.setAsPrimary,
    required this.name,
    required this.provinceId,
    required this.provinceName,
    required this.districtId,
    required this.districtName,
    required this.wardCode,
    required this.wardName,
    required this.detail,
    required this.phoneNum,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'setAsPrimary': setAsPrimary,
      'name': name,
      'provinceId': provinceId,
      'provinceName': provinceName,
      'districtId': districtId,
      'districtName': districtName,
      'wardCode': wardCode,
      'wardName': wardName,
      'detail': detail,
      'phoneNum': phoneNum,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] as int,
      setAsPrimary: map['active'] as bool,
      name: map['name'] as String,
      provinceId: map['provinceId'] as int,
      provinceName: map['provinceName'] as String,
      districtId: map['districtId'] as int,
      districtName: map['districtName'] as String,
      wardCode: map['wardCode'] as String,
      wardName: map['wardName'] as String,
      detail: map['detail'] as String,
      phoneNum: map['phoneNum'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);
}
