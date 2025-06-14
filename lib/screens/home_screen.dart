import 'package:flutter/material.dart';
import 'destination_detail_screen.dart';
import '../routes/app_routes.dart'; // ✅ Gunakan relative path, bukan package yang tidak didefinisikan

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key); // ✅ Tambahkan key

  final List<String> categories = const [
    'Pantai',
    'Sejarah',
    'Kuliner',
    'Alam',
    'Religi',
  ];

  final List<String> popularDestinations = const [
    'assets/images/trikora.png',
    'assets/images/lagoybay.png',
    'assets/images/patungseribu.png',
    'assets/images/tepilaut.png',
    'assets/images/treasurebay.png',
  ];

  final List<String> destinationNames = const [
    'Pantai Trikora',
    'LAGOYBAY',
    'Patung Seribu',
    'Taman Tepi Laut Tanjungpinang',
    'Benteng Bukit Kursi',
  ];

  final List<String> descriptions = const [
    'Pantai Trikora memiliki pasir putih yang luas dan air yang jernih...',
    'Lagoi Bay adalah kawasan pariwisata bertaraf internasional di Pulau Bintan...',
    'Jelajahi Keajaiban Patung Seribu di Bintan: Gerbang Menuju Dunia Penuh Pesona!',
    'Desa wisata dengan nuansa alami, cocok untuk keluarga...',
    'Situs bersejarah di atas bukit dengan pemandangan laut lepas...',
  ];

  final List<List<String>> facilityImages = const [
    [
      'assets/images/fasilitas_trikora1.png',
      'assets/images/fasilitas_trikora2.png',
    ],
    [
      'assets/images/fasilitas_lagoybay1.png',
      'assets/images/fasilitas_lagoybay2.png',
    ],
    [
      'assets/images/fasilitas_patungseribu1.png',
      'assets/images/fasilitas_patungseribu2.png',
    ],
    [
      'assets/images/fasilitas_ekang1.png',
      'assets/images/fasilitas_ekang2.png',
    ],
    [
      'assets/images/fasilitas_bukitkursi1.png',
      'assets/images/fasilitas_bukitkursi2.png',
    ],
  ];

  final List<String> bannerIcons = const [
    'assets/images/trikora.png',
    'assets/images/lagoybay.png',
    'assets/images/patungseribu.png',
    'assets/images/tepilaut.png',
    'assets/images/treasurebay.png',
  ];

  final List<List<String>> infoImages = const [
    ['assets/images/info_trikora1.png', 'assets/images/info_trikora2.png'],
    ['assets/images/info_lagoybay1.png', 'assets/images/info_lagoybay2.png'],
    [
      'assets/images/info_patungseribu1.png',
      'assets/images/info_patungseribu2.png',
    ],
    ['assets/images/info_ekang1.png', 'assets/images/info_ekang2.png'],
    [
      'assets/images/info_bukitkursi1.png',
      'assets/images/info_bukitkursi2.png',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jejak Pulau Bintan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.profile,
              ); // ✅ Gunakan AppRoutes
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: popularDestinations.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DestinationDetailScreen(
                              name: destinationNames[index],
                              imagePath: popularDestinations[index],
                              description: descriptions[index],
                              location: 'Bintan, Kepulauan Riau',
                              facilityImages: facilityImages[index],
                              bannerIcon: bannerIcons[index],
                              infoImages: infoImages[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          popularDestinations[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.grey[300],
                                child: const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    size: 48,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.place),
                    title: Text(destinationNames[index]),
                    subtitle: const Text('Rating: ⭐⭐⭐⭐☆'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationDetailScreen(
                            name: destinationNames[index],
                            imagePath: popularDestinations[index],
                            description: descriptions[index],
                            location: 'Bintan, Kepulauan Riau',
                            facilityImages: facilityImages[index],
                            bannerIcon: bannerIcons[index],
                            infoImages: infoImages[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
