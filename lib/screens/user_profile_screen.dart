import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Pengguna'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Avatar
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/user_avatar.png',
              ), // Ganti dengan avatar default
            ),
            const SizedBox(height: 16),

            // Nama pengguna
            const Text(
              'Sapar Hidayat',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'sapar@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Info tambahan
            ListTile(
              leading: const Icon(Icons.location_city),
              title: const Text('Tanjung Dua, Lingga, Kepri'),
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Teknik Informatika - UMRAH'),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Pengguna sejak 2024'),
            ),

            const Spacer(),

            // Tombol logout
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                icon: const Icon(Icons.logout),
                label: const Text('Keluar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
