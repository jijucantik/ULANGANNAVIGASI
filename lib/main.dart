import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanLogin(),
        '/home': (context) => const HalamanUtama(),
      },
    );
  }
}

// NOMOR 1: HALAMAN LOGIN
class HalamanLogin extends StatelessWidget {
  const HalamanLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login - Imroatul Azizah'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.rocket_launch,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Selamat Datang di TechExpress',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                );
              },
              child: const Text('Masuk ke Aplikasi'),
            ),
          ],
        ),
      ),
    );
  }
}

// NOMOR 4 DAN 5: HALAMAN UTAMA DAN BOTTOM NAVIGATION
class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int halamanAktif = 1;

  final List<Widget> halaman = [
    const HalamanStore(),
    const HalamanKatalog(),
    const HalamanUser(),
    const HalamanProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: halaman[halamanAktif],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: halamanAktif,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            halamanAktif = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// HALAMAN STORE
class HalamanStore extends StatelessWidget {
  const HalamanStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechExpress - Store'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.store,
              size: 80,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Selamat Datang di TechExpress Store',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// NOMOR 4: HALAMAN KATALOG DENGAN 6 GADGET
class HalamanKatalog extends StatelessWidget {
  const HalamanKatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> daftarGadget = [
      {
        'nama': 'iPhone 16',
        'harga': 'Rp15.000.000',
        'icon': Icons.phone_iphone,
      },
      {
        'nama': 'Samsung Galaxy S25',
        'harga': 'Rp13.000.000',
        'icon': Icons.smartphone,
      },
      {
        'nama': 'MacBook Air',
        'harga': 'Rp18.000.000',
        'icon': Icons.laptop_mac,
      },
      {
        'nama': 'iPad Air',
        'harga': 'Rp10.000.000',
        'icon': Icons.tablet_mac,
      },
      {
        'nama': 'Smartwatch',
        'harga': 'Rp2.000.000',
        'icon': Icons.watch,
      },
      {
        'nama': 'Headphone',
        'harga': 'Rp750.000',
        'icon': Icons.headphones,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TechExpress - Katalog'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text(
            'Katalog Gadget',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...daftarGadget.map((gadget) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanDetail(
                      nama: gadget['nama'] as String,
                      harga: gadget['harga'] as String,
                      icon: gadget['icon'] as IconData,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        gadget['icon'] as IconData,
                        size: 55,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              gadget['nama'] as String,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(gadget['harga'] as String),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// NOMOR 3: HALAMAN PILIH VOUCHER
class HalamanVoucher extends StatelessWidget {
  const HalamanVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Voucher'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pilih Voucher Diskon',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Diskon 10%');
              },
              child: const Text('Diskon 10%'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Diskon 20%');
              },
              child: const Text('Diskon 20%'),
            ),
          ],
        ),
      ),
    );
  }
}

// NOMOR 2 DAN 6: DETAIL GADGET
class HalamanDetail extends StatefulWidget {
  final String nama;
  final String harga;
  final IconData icon;

  const HalamanDetail({
    super.key,
    required this.nama,
    required this.harga,
    required this.icon,
  });

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  String voucherTerpilih = '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${widget.nama}'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 100,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              Text(
                widget.nama,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Harga: ${widget.harga}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Voucher: $voucherTerpilih',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async {
                  final String? hasil = await Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HalamanVoucher(),
                    ),
                  );

                  if (hasil != null) {
                    setState(() {
                      voucherTerpilih = hasil;
                    });
                  }
                },
                child: const Text('Klaim Voucher Diskon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HALAMAN USER
class HalamanUser extends StatelessWidget {
  const HalamanUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechExpress - User'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Selamat Datang, Zazi Cantiik!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Selamat datang di TechExpress.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Card(
              margin: EdgeInsets.all(20),
              child: ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.blue,
                  size: 40,
                ),
                title: Text('Jiju Cantik'),
                subtitle: Text('Hai ini akunnya azii imut banget yaappp'),
              ),
            ),
           
             
            
          ],
        ),
      ),
    );
  }
}
// NOMOR 5: HALAMAN PROFILE DAN LOGOUT
class HalamanProfile extends StatelessWidget {
  const HalamanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechExpress - Profile'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Kode Member: MEMBER001',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}