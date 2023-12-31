import 'package:flutter/material.dart';
import 'package:flutter_project/LoginPage.dart';
import 'package:flutter_project/RegisterPage.dart';
import 'package:get/get.dart';
import 'AuthController.dart';
import 'HomePage.dart'; // Pastikan Anda memiliki file HomePage.dart

void main() {
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      initialRoute: '/login', // Set halaman awal ke halaman login
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        // Tambahkan definisi rute untuk halaman home jika diperlukan
        GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}
