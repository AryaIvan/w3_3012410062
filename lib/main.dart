import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UtamaBottomNavScreen(),
      routes: {
        '/beranda': (context) => const BerandaPage(),
        '/tentang': (context) => const TentangPage(),
        '/produk': (context) => const ProdukListPage(),
        '/halaman_satu': (context) => const HalamanSatu(),
        '/halaman_dua': (context) => const HalamanDua(),
        '/halaman_tiga': (context) => const HalamanTiga(),
      },
    );
  }
}

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selamat Datang di Beranda Utama', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TentangPage(),
                  ),
                );
              },
              icon: const Icon(Icons.info_outline),
              label: const Text('Tentang Kami'),
            ),
          ],
        ),
      ),
    );
  }
}

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Kami'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ini adalah Halaman Informasi Tentang Kami', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProdukModel {
  final String nama;
  final int harga;
  final String deskripsi;

  const ProdukModel({required this.nama, required this.harga, required this.deskripsi});
}

class ProdukListPage extends StatelessWidget {
  const ProdukListPage({super.key});

  final List<ProdukModel> daftarProduk = const [
    ProdukModel(nama: 'Laptop ASUS ROG', harga: 15000000, deskripsi: 'Laptop gaming performa tinggi dengan kartu grafis NVIDIA RTX.'),
    ProdukModel(nama: 'Smartphone Samsung Galaxy', harga: 7500000, deskripsi: 'Ponsel pintar dengan kamera jernih dan baterai tahan lama.'),
    ProdukModel(nama: 'Headset Wireless Sony', harga: 1200500, deskripsi: 'Headset nirkabel dengan fitur active noise cancellation.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk'),
        backgroundColor: Colors.green.shade100,
      ),
      body: ListView.builder(
        itemCount: daftarProduk.length,
        itemBuilder: (context, index) {
          final produk = daftarProduk[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.shopping_bag)),
              title: Text(produk.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Rp ${produk.harga.toString()}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProdukDetailPage(produk: produk),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProdukDetailPage extends StatelessWidget {
  final ProdukModel produk;

  const ProdukDetailPage({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produk.nama),
        backgroundColor: Colors.green.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              produk.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Harga: Rp ${produk.harga}',
              style: TextStyle(fontSize: 20, color: Colors.green.shade700, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            const Text('Deskripsi Produk:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(produk.deskripsi, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali ke Katalog'),
            ),
          ],
        ),
      ),
    );
  }
}

class HalamanSatu extends StatelessWidget {
  const HalamanSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
        backgroundColor: Colors.orange.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Halaman Pertama', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/halaman_dua',
                  arguments: 'Data Pesan Terkirim dari Halaman Pertama',
                );
              },
              child: const Text('Lanjut ke Halaman Kedua (Kirim Data)'),
            ),
          ],
        ),
      ),
    );
  }
}

class HalamanDua extends StatelessWidget {
  const HalamanDua({super.key});

  @override
  Widget build(BuildContext context) {
    final String pesan = ModalRoute.of(context)!.settings.arguments as String? ?? 'Tidak ada data';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Informasi'),
        backgroundColor: Colors.orange.shade100,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Halaman Kedua', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Text('Pesan diterima: "$pesan"', style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.deepOrange)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/halaman_tiga');
                },
                child: const Text('Lanjut ke Halaman Ketiga'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HalamanTiga extends StatelessWidget {
  const HalamanTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Konfirmasi'),
        backgroundColor: Colors.orange.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Halaman Ketiga (Akhir Navigasi)', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/halaman_satu'));
              },
              child: const Text('Kembali ke Awal'),
            ),
          ],
        ),
      ),
    );
  }
}

class UtamaBottomNavScreen extends StatefulWidget {
  const UtamaBottomNavScreen({super.key});

  @override
  State<UtamaBottomNavScreen> createState() => _UtamaBottomNavScreenState();
}

class _UtamaBottomNavScreenState extends State<UtamaBottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    TabBeranda(),
    TabCari(),
    TabProfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class TabBeranda extends StatelessWidget {
  const TabBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selamat Datang di Aplikasi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/beranda'),
              icon: const Icon(Icons.swap_horiz),
              label: const Text('Buka Navigasi Push & Pop'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/produk'),
              icon: const Icon(Icons.shopping_bag),
              label: const Text('Buka Katalog Produk'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/halaman_satu'),
              icon: const Icon(Icons.alt_route),
              label: const Text('Buka Named Routes'),
            ),
          ],
        ),
      ),
    );
  }
}

class TabCari extends StatelessWidget {
  const TabCari({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencarian'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            TextField(
              decoration: InputDecoration(
                labelText: 'Cari produk atau informasi...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabProfil extends StatelessWidget {
  const TabProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            SizedBox(height: 16),
            Text('Nama: Pengguna Aplikasi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Email: user@email.com', style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
