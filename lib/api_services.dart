import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: 'https://book-crud-service-6dmqxfovfq-et.a.run.app'));

  String getAuthToken() {
    // Implementasi sesuai dengan cara Anda mendapatkan token
    // ...
    return "token";
  }

  Map<String, String> getHeaders() {
    String token = getAuthToken();
    if (isTokenExpired(token)) {
      token = refreshAuthToken();
    }
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  bool isTokenExpired(String token) {
    // Implementasi pemeriksaan kedaluwarsa sesuai kebutuhan
    // ...
    return false;
  }

  String refreshAuthToken() {
    // Implementasi pembaruan token sesuai kebutuhan
    // ...
    return "your_refreshed_token_here";
  }

  Future<void> fetchData() async {
    try {
      var response =
          await _dio.get('/api/books', options: Options(headers: getHeaders()));
      if (response.statusCode == 200) {
        var data = response.data;
        print('Data: $data');
      } else {
        print('Gagal mendapatkan data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<Response> login(String email, String password) {
    return _dio
        .post('/api/login', data: {'email': email, 'password': password});
  }

  Future<Response> register(String name, String email, String password) {
    return _dio.post('/api/register',
        data: {'name': name, 'email': email, 'password': password});
  }

  bool isLoggedIn() {
    // Implementasi sesuai kebutuhan
    // ...
    return false;
  }
}

void main() async {
  // Contoh penggunaan
  ApiService apiService = ApiService();
}
