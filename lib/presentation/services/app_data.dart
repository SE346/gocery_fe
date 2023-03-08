import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppData extends ChangeNotifier {
  late final Future<SharedPreferences> sharedPreferences;

  // Tenant
  int? _tenant;
  int? get tenant => _tenant;
  set tenant(int? id) {
    if (id == null) return;

    sharedPreferences.then((shared) {
      shared.setInt('tenant', id);
    });
    _tenant = id;
    notifyListeners();
  }

  // tenant name
  String? _tenantName;
  String? get tenantName => _tenantName;
  set tenantName(String? name) {
    if (name == null) return;

    sharedPreferences.then((shared) {
      shared.setString('tenantName', name);
    });
    _tenantName = name;
    initHeaders();
    notifyListeners();
  }

  // Access Token
  String? _accessToken;
  String? get accessToken => _accessToken;
  set accessToken(String? token) {
    if (token == null) return;

    sharedPreferences.then((shared) {
      shared.setString('accessToken', token);
    });
    _accessToken = token;

    initHeaders();
    notifyListeners();
  }

  // Remember me
  List<String>? _rememberMe;
  List<String>? get rememberMe => _rememberMe;

  /// list: [email, password]
  set rememberMe(List<String>? rememberMe) {
    if (rememberMe == null) return;

    sharedPreferences.then((shared) {
      shared.setStringList("rememberAccount", rememberMe);
    });
    _rememberMe = rememberMe;
    notifyListeners();
  }

  // Type language
  String? _typeLanguage;
  String? get typeLanguage => _typeLanguage;
  set typeLanguage(String? laguage) {
    if (laguage == null) return;

    sharedPreferences.then((shared) {
      shared.setString("typeLanguage", laguage);
    });
    _typeLanguage = laguage;
    notifyListeners();
  }

  // headers
  Map<String, String> _headers = {'Content-Type': 'application/json'};
  Map<String, String> get headers => _headers;

  AppData(this.sharedPreferences) {
    getTypeLanguage();
    getToken();
    getTenant();
    getTenantName();
    initHeaders();
  }

  initHeaders() {
    if (_tenant != null && _accessToken != null) {
      _headers = {
        'Content-Type': 'application/json',
        'Abp.TenantId': '$_tenant',
        'Authorization': 'Bearer $_accessToken'
      };
      notifyListeners();
    } else if (_tenant != null) {
      _headers = {
        'Content-Type': 'application/json',
        'Abp.TenantId': '$_tenant',
      };
      notifyListeners();
    } else if (_accessToken != null) {
      _headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_accessToken'
      };
      notifyListeners();
    }
    // log("init headers: $_headers");
  }

  getTypeLanguage() async {
    final shared = await sharedPreferences;
    _typeLanguage = shared.getString("typeLanguage");
    log("init language: $_typeLanguage");
    notifyListeners();
  }

  getTenant() async {
    final shared = await sharedPreferences;
    _tenant = shared.getInt("tenant");
    log("init tenant: $_tenant");
    notifyListeners();
    initHeaders();
  }

  getTenantName() async {
    final shared = await sharedPreferences;
    _tenantName = shared.getString("tenantName");
    log("init tenantName: $_tenantName");
    notifyListeners();
  }

  getToken() async {
    final shared = await sharedPreferences;
    _accessToken = shared.getString("accessToken");
    log("init token: $_accessToken");
    notifyListeners();
    initHeaders();
  }

  Future removeTenant() async {
    final shared = await sharedPreferences;
    shared.remove("tenant");
    shared.remove("tenantName");
    tenant = null;
    tenantName = null;
    notifyListeners();
  }

  Future removeToken() async {
    final shared = await sharedPreferences;
    shared.remove('accessToken');
    _accessToken = null;
    notifyListeners();
  }

  Future removeRememberAccount() async {
    final shared = await SharedPreferences.getInstance();
    shared.remove('rememberAccount');
    _rememberMe = null;
    notifyListeners();
  }
}
