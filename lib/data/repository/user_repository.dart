import 'dart:convert';
import 'dart:developer';

import 'package:grocery/data/environment.dart';
import 'package:grocery/data/interfaces/i_service_api.dart';
import 'package:grocery/data/models/address.dart';
import 'package:grocery/data/models/place.dart';
import 'package:grocery/data/models/user.dart';
import 'package:grocery/data/network/base_api_service.dart';
import 'package:grocery/data/network/network_api_service.dart';
import 'package:grocery/data/response/base_response.dart';
import 'package:grocery/presentation/services/app_data.dart';

class UserRepository extends IServiceAPI {
  String urlGetInfo = "user/get-info";

  final BaseApiServices apiServices = NetworkApiService();
  final AppData _appData;

  UserRepository(this._appData) {
    urlGetInfo = localURL + urlGetInfo;
  }

  @override
  User convertToObject(value) {
    return User.fromJson(value);
  }

  Future<User?> getUserInfo() async {
    try {
      final response = await apiServices.get(
        urlGetInfo,
        _appData.headers,
      );

      final BaseResponse baseResponse = BaseResponse.fromJson(response);

      User user = User.fromMap(baseResponse.data);

      return user;
    } catch (e) {
      log("error get user info: $e");
    }

    return null;
  }
}
