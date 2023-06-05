import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:grocery/data/environment.dart';
import 'package:grocery/data/interfaces/i_service_api.dart';
import 'package:grocery/data/models/coupon.dart';
import 'package:grocery/data/models/user.dart';
import 'package:grocery/data/network/base_api_service.dart';
import 'package:grocery/data/network/network_api_service.dart';
import 'package:grocery/data/response/base_response.dart';
import 'package:grocery/presentation/services/app_data.dart';

class CouponRepository extends IServiceAPI {
  String urlGetAllCoupons = 'coupon';

  final BaseApiServices apiServices = NetworkApiService();
  final AppData _appData;

  CouponRepository(this._appData) {
    urlGetAllCoupons = localURL + urlGetAllCoupons;
  }

  @override
  Coupon convertToObject(value) {
    return Coupon.fromMap(value);
  }

  Future<List<Coupon>> getAllCoupons() async {
    List<Coupon> coupons = [];

    try {
      final response = await apiServices.get(
        urlGetAllCoupons,
        _appData.headers,
      );

      final result = BaseResponse.fromJson(response);

      for (var map in result.data) {
        Coupon coupon = convertToObject(map);
        coupons.add(coupon);
      }
    } catch (e) {
      print('Error get coupons: $e');
    }

    return coupons;
  }
}
