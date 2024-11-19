import 'package:flutter/material.dart';
import 'package:lahzadi/screens/list_productentry.dart';
import 'package:lahzadi/screens/login.dart';
import 'package:lahzadi/screens/productentry_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

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
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Buat interaktif
        onTap: () async {
          // Menampilkan SnackBar saat item ditekan
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          if (item.name == "Tambah Produk") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductEntryFormPage(),
                ));
          } else if (item.name == "Lihat Daftar Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductEntryPage()),
            );
          } else if (item.name == "Logout") {
            final response =
                await request.logout("http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false, // Hapus halaman-halaman sebelumnya
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
          }
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
