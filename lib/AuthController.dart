import 'package:get/get.dart';
import 'package:dio/dio.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs;
  final Dio _dio = Dio(); // Sesuaikan dengan konfigurasi Dio Anda

  Future<void> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        isLoggedIn.value = true;
        // Navigasi ke halaman home setelah berhasil login
        Get.offNamed('/home');
      } else {
        print('Gagal login: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> register(String name, String email, String password) async {
    try {
      // Mengirim permintaan ke endpoint register
      final response = await _dio.post(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/register',
        data: {'name': name, 'email': email, 'password': password},
      );

      // Memeriksa apakah respons berhasil
      if (response.statusCode == 200) {
        // Berhasil register, set isLoggedIn menjadi true
        isLoggedIn.value = true;

        // Setelah registrasi, arahkan pengguna ke halaman login
        Get.toNamed('/login');
      } else {
        // Gagal register, tampilkan pesan atau lakukan penanganan kesalahan lainnya
        print('Gagal register: ${response.statusCode}');
      }
    } catch (error) {
      // Tangani kesalahan jaringan atau lainnya
      print('Error: $error');
    }
  }

// Fungsi untuk menyimpan data pengguna ke API
  Future<void> saveUserDataToApi(
      String name, String email, String password) async {
    try {
      // Implementasi penyimpanan data ke API sesuai kebutuhan Anda
      // Misalnya, kirim permintaan HTTP ke endpoint penyimpanan data pengguna
      // atau gunakan metode penyimpanan data sesuai kebijakan API
    } catch (error) {
      // Tangani kesalahan penyimpanan data ke API
      print('Error saving user data to API: $error');
    }
  }

  void logout() {
    isLoggedIn.value = false;
    // Implementasi logout di sini
    Get.offNamed('/login');
  }
}
