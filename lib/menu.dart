import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = '2306152254';
  final String name = 'Freia Arianti Zulaika';
  final String className = 'PBP C';

  // List items dari tiga item ItemHomepage, icon dan warnanya berbeda-beda
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.inventory, Colors.green[300]!),
    ItemHomepage("Tambah Produk", Icons.add, Colors.teal[400]!),
    ItemHomepage("Logout", Icons.logout, Colors.cyan[400]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold buat dasar pagenya, termasuk AppBar dan body
      appBar: AppBar(
        // AppBar
        title: const Text(
          'Lahzadi',
          style: TextStyle(
            color: Color.fromARGB(255, 203, 202, 202),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Baris pertama berisi tiga InfoCard untuk NPM, Nama, dan Kelas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(
                height: 16.0), // Space antara bagian infoCard dengan welcome
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Lahzadi!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  // GridView untuk menampilkan daftar item dengan dalam bentuk 3 kolom
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    // Bikin setiap item dalam daftar `items` menjadi ItemCard
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Buat item di halaman utamanya, propertinya ada name, icon, dan color
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Buat interaktif
        onTap: () {
          // Menampilkan SnackBar saat item ditekan
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0), // Spasi antara title dan content
            Text(content),
          ],
        ),
      ),
    );
  }
}
