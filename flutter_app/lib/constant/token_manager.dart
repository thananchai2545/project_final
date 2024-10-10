import 'package:flutter/material.dart';
import 'package:flutter_app/constant/config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  static const _storage = FlutterSecureStorage();

  Future<String?> loadToken() async {
    return await _storage.read(key: 'token');
  }

  Future<String?> loadMemberId() async {
    return await _storage.read(key: 'member_id');
  }

  Future<void> saveToken(Map<String, dynamic> data) async {
    // print(token);
    // _token = token;
    await _storage.write(key: 'token', value: data['token']);
    await _storage.write(
        key: 'member_id', value: data['data'][0]['id'].toString());
    notifyListeners();
  }

  Future<void> clearToken() async {
    // _token = null;
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'member_id');
    notifyListeners();
  }

  Future<bool> isTokenValid() async {
    final token = await loadToken();
    return token != null && token.isNotEmpty;
  }

  Future<bool> validateNavigationToProtectedRoute() async {
    final String? token = await loadToken();
    final response = await http.get(
      Uri.parse('${Config.API_URL}/api-app/member/validate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
