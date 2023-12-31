import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> login(String email, String password) {
    return _dio
        .post('/api/login', data: {'email': email, 'password': password});
  }

  Future<Response> register(String name, String email, String password) {
    return _dio.post('/api/register',
        data: {'name': name, 'email': email, 'password': password});
  }

  Dio get dio => _dio;
}
