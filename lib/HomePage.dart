import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AuthController.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/home_image.png', // Sesuaikan dengan path gambar Anda
              width: 200,
              height: 200,
            ),
            const Text('Selamat datang di halaman Home!'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman daftar buku
                Get.toNamed('/daftar-buku');
              },
              child: const Text('Daftar Buku'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Panggil fungsi logout dari AuthController
                Get.find<AuthController>().logout();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
