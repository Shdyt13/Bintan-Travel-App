import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Akun')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Nama Lengkap'),
            ),
            TextField(decoration: const InputDecoration(labelText: 'Email')),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Konfirmasi Password',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Di tahap awal, langsung arahkan ke login atau home
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Daftar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Sudah punya akun? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
