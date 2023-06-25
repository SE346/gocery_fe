import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:grocery/data/environment.dart';
import 'package:grocery/data/interfaces/i_service_api.dart';
import 'package:grocery/data/models/order.dart';
import 'package:grocery/data/models/user.dart';
import 'package:grocery/data/network/base_api_service.dart';
import 'package:grocery/data/network/network_api_service.dart';
import 'package:grocery/data/response/base_response.dart';
import 'package:grocery/presentation/services/app_data.dart';

class OrderRepository extends IServiceAPI {
  String urlCreateOrder = 'order/';
  String urlCreateOrderFromCart = 'order/cart';
  String urlGetAllOrderBelongToUser = 'order';
  String urlGetAllOrder = 'order/admin';
  String urlLogin = 'auth/login';
  String urlRefreshToken = 'auth/refresh-token';
  String urlLogout = "auth/logout";

  final BaseApiServices apiServices = NetworkApiService();
  final AppData _appData;

  OrderRepository(this._appData) {
    urlCreateOrder = localURL + urlCreateOrder;
    urlCreateOrderFromCart = localURL + urlCreateOrderFromCart;
    urlGetAllOrderBelongToUser = localURL + urlGetAllOrderBelongToUser;
    urlRefreshToken = localURL + urlRefreshToken;
    urlLogout = localURL + urlLogout;
    urlGetAllOrder = localURL + urlGetAllOrder;
  }

  @override
  Order convertToObject(value) {
    return Order.fromMap(value);
  }

  Future<void> createOrder(Order order) async {
    try {
      final response = await apiServices.post(
        urlCreateOrder,
        order.toMap(),
        _appData.headers,
      );
      print(response);
    } catch (e) {
      log('Error create order: $e');
    }
  }

  Future<void> createOrderFromCart(Order order) async {
    try {
      final response = await apiServices.post(
        urlCreateOrderFromCart,
        order.toMap(),
        _appData.headers,
      );
      print(response);
    } catch (e) {
      log('Error create order from cart: $e');
    }
  }

  Future<List<Order>> getAllOrderBelongToUser() async {
    List<Order> orders = [];
    try {
      final response = await apiServices.get(
        urlGetAllOrderBelongToUser,
        _appData.headers,
      );

      final BaseResponse baseResponse = BaseResponse.fromJson(response);

      for (var json in baseResponse.data) {
        Order order = Order.fromMap(json);
        orders.add(order);
      }
    } catch (e) {
      log("error get all orders belong to user: $e");
    }

    return orders;
  }

  Future<List<Order>> getAllOrders() async {
    List<Order> orders = [];
    try {
      final response = await apiServices.get(
        urlGetAllOrder,
        _appData.headers,
      );

      final BaseResponse baseResponse = BaseResponse.fromJson(response);

      for (var json in baseResponse.data) {
        Order order = Order.fromMap(json);
        orders.add(order);
      }
    } catch (e) {
      log("error get all orders: $e");
    }

    return orders;
  }

  Future<BaseResponse?> register(User user) async {
    try {
      final response = await apiServices.post(
        urlCreateOrder,
        user.toMap(),
        _appData.headers,
      );

      final result = BaseResponse.fromJson(response);
      print(result);
      return result;
    } catch (e) {
      print('Error register: $e');
      return null;
    }
  }

  Future<BaseResponse?> login(String email, String password) async {
    try {
      final response = await apiServices.post(
        urlLogin,
        {
          "email": email,
          "password": password,
        },
        _appData.headers,
      );

      return BaseResponse.fromJson(response);
    } catch (e) {
      print('Error login: $e');
      return null;
    }
  }

  Future<String?> refreshToken() async {
    await _appData.getRefreshToken();
    try {
      final response = await apiServices.post(
        urlRefreshToken,
        {
          "refreshToken": _appData.refreshToken,
        },
        _appData.headers,
      );

      BaseResponse baseResponse = BaseResponse.fromJson(response);
      if (baseResponse.statusCode == 200) {
        return baseResponse.data['accessToken'];
      }
    } catch (e) {
      print('Error refreshToken: $e');
    }
    return null;
  }

  Future<bool> checkUserLoggined() async {
    await _appData.getToken();
    String? token = _appData.accessToken ?? '';

    if (token.isEmpty) {
      return false;
    }

    try {
      // Verify a token
      JWT.verify(token, SecretKey(secretKey));
    } on JWTExpiredException {
      String? newAccessToken = await refreshToken();

      if (newAccessToken != null) {
        log("AT: $newAccessToken");
        saveAccessToken(newAccessToken);
      }
    }

    token = _appData.accessToken ?? '';

    return true;
  }

  String getRole() {
    JWT jwt = JWT.decode(_appData.accessToken!);
    dynamic payload = jwt.payload;
    return payload['user']['role'];
  }

  void saveAccessToken(String accessToken) {
    _appData.accessToken = accessToken;
  }

  void saveRefreshToken(String refreshToken) {
    _appData.refreshToken = refreshToken;
  }
}
