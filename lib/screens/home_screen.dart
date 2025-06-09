import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = [
    'Pantai',
    'Sejarah',
    'Kuliner',
    'Alam',
    'Religi',
  ];
  final List<String> popularDestinations = [
    'assets/destinasi1.png',
    'assets/destinasi2.png',
    'assets/destinasi3.png',
    'assets/destinasi4.png',
    'assets/destinasi5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jejak Pulau Bintan'),
        actions: [
          IconButton(icon: const Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Selamat Datang di Jejak Pulau Bintan!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari destinasi...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Kategori
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(categories[index]),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Carousel Destinasi Populer
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: popularDestinations.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(popularDestinations[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Destinasi Berperingkat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // Daftar Destinasi Berperingkat
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.place),
                  title: Text('Destinasi ${index + 1}'),
                  subtitle: const Text('Rating: ⭐⭐⭐⭐☆'),
                  onTap: () {
                    // Navigate to detail
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
