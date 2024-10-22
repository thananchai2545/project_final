import 'dart:convert';

import 'package:ambulance/constant/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final FlutterSecureStorage _storage = FlutterSecureStorage();

class AuthService extends ChangeNotifier {
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<void> saveId(String id) async {
    await _storage.write(key: 'id', value: id);
    notifyListeners();
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<String?> getId() async {
    return await _storage.read(key: 'id');
  }

  Future<void> clearToken() async {
    // _token = null;
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'id');
    notifyListeners();
  }

  Future<bool> validateNavigationToProtectedRoute() async {
    String? token = await getToken();
    var response = await http.get(
      Uri.parse('${Config.API_URL}/api-ambulance/ambulance/validate'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('ad');
      return false;
    }
    // print(token);
    // return true;
  }
}
