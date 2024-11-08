import 'package:flutter/material.dart';
import 'package:lahzadi/screens/productentry_form.dart';
import 'package:lahzadi/widgets/left_drawer.dart';
import 'package:lahzadi/widgets/product_card.dart';

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
        iconTheme: const IconThemeData(color: Colors.white), // Icon drawer
      ),
      drawer: const LeftDrawer(), // Nambahin drawer ke AppBar-nya
      // Body dari tampilan
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
