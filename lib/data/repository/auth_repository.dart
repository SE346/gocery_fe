import 'dart:developer';

import 'package:grocery/data/environment.dart';
import 'package:grocery/data/interfaces/i_service_api.dart';
import 'package:grocery/data/models/user.dart';
import 'package:grocery/data/network/base_api_service.dart';
import 'package:grocery/data/network/network_api_service.dart';
import 'package:grocery/data/response/base_response.dart';
import 'package:grocery/presentation/services/app_data.dart';

class AuthRepository extends IServiceAPI {
  String urlRegister = 'auth/register';
  String urlLogin = 'auth/login';

  final BaseApiServices apiServices = NetworkApiService();
  final AppData _appData;

  AuthRepository(this._appData) {
    urlRegister = localURL + urlRegister;
    urlLogin = localURL + urlLogin;
  }

  @override
  User convertToObject(value) {
    return User.fromMap(value);
  }

  Future<BaseResponse?> register(User user) async {
    try {
      final response = await apiServices.post(
        urlRegister,
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

      final result = BaseResponse.fromJson(response);
      print(result);
      return result;
    } catch (e) {
      print('Error login: $e');
      return null;
    }
  }
}
