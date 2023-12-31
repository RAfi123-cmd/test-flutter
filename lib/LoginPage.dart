import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AuthController.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Panggil fungsi login dari AuthController
                Get.find<AuthController>().login(
                  emailController.text,
                  passwordController.text,
                );
                Get.toNamed('/home');
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            const Text('Belum punya akun?'),
            TextButton(
              onPressed: () {
                // Navigasi ke halaman registrasi jika belum punya akun
                Get.toNamed('/register');
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
