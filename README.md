# Lahzadi

Proyek Flutter untuk tugas mata kuliah Pemrograman Berbasis Platform Ganjil 2024/2025. Dibuat oleh Freia Arianti Zulaika - 2306152254.

<details>
<Summary><b>Tugas 7: Elemen Dasar Flutter</b></Summary>

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
_Stateless widget_ dan _stateful widget_ adalah dua jenis bentuk penggunaan _widget_ yang secara umum dapat dibedakan dari cara kerja tampilan suatu _widget_. Dari namanya sendiri, dapat diketahui bahwa _stateless widget_ merupakan _widget_ yang tidak memiliki _state_, sehingga tampilan dari suatu _widget_ tidak akan berubah (bersifat statis). Contoh dari _stateless widget_ seperti icon dan image. Sedangkan, _stateful widget_ memiliki _state_ yang dapat membuat terjadinya perubahan pada tampilan suatu _widget_ (bersifat dinamis). Contoh dari _stateful widget_ adalah InkWell dan Checkbox.

## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Dalam proyek ini, saya menggunakan _stateless widget_. Beberapa _widget_ yang saya gunakan di proyek ini adalah:
* MyApp
_Widget_ ini berfungsi sebagai _root_ dari Lahzadi. _Widget_ ini menyimpan keseluruhan tema dan warna dari proyek ini. Selain itu, MyApp juga menyimpan _widget_ MyHomePage sebagai halaman utama yang akan dituju ketika mengakses proyek.
* MyHomePage
_Widget_ ini berfungsi sebagai halaman _home_ dari Lahzadi. _Widget_ ini menyimpan data-data apa saja yang akan ditampilkan serta mengatur letak dari _widget_ InfoCard dan ItemCard yang akan ditampilkan di halaman _home_.
* ItemCard
_Widget_ ini berfungsi dalam menampikan tombol-tombol yang bersifat interaktif. _Widget_ ini mengatur bentuk, tema, warna, dan aksi yang dapat dilakukan pada _cards_ sehingga dapat bertindak sebagai tombol.
* InfoCard
_Widget_ ini berfungsi dalam menampilkan data-data seperti name, npm, dan classname dalam bentuk _card_ yang sudah disimpan di _widget_ MyHomePage. _Widget_ ini juga berfungsi dalam mengatur bentuk, tema, dan warna yang akan ditampilkan.

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` merupakan fungsi di _stateful widget_ yang berfungsi untuk memberi tahu _framework_ bahwa _state_ internal yang ada di _widget_ tersebut telah berubah dan untuk mengubah tampilan UI pengguna, perlu dilakukan _rebuild_. Jika suatu _state_ berubah dan tidak memanggil fungsi `setState()`, maka tampilan UI pengguna tidak akan menunjukkan perubahannya. Variabel-variabel yang terdampak dari fungsi ini yaitu variabel yang berada di dalam objek _state_.

## Jelaskan perbedaan antara const dengan final!
* `final`: akan di-inisialisasi ketika _runtime_. Dalam Flutter, ketika kita memanggil `setState()` dan melakukan _rebuild_, maka variabel-variabel `final` yang ada di method _Build_ akan di-inisialisasi kembali. Ketika sudah di-inisialisasi, `final` bersifat _immutable_. `final` dapat digunakan ketika kita belum mengetahui apa nilai yang akan dikeluarkan saat _compile time_. Contohnya ketika kita ingin membuat variabel yang membutuhkan waktu saat _runtime_, maka datanya akan kerap berubah tiap kali dijalankan.
* `const`: akan di-inisialisasi ketika _compile time_ dan nilainya sudah tersedia saat _runtime_. `const` bersifat _immutable_ dan nilainya harus sudah diketahui ketika waktu _compile_. Contohnya ketika kita ingin membuat variabel yang berisi kalimat yang selalu sama tiap kali dijalankan.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
### Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
1. Pertama, saya membuat direktori baru di lokal.
2. Di direktori tersebut, saya melakukan perintah berikut untuk memulai proyek flutter:
    ```
    flutter create lahzadi
    ```
3. Setelah membuat `lahzadi`, saya masuk ke dalam direktori tersebut dan melakukan `git init` untuk mulai menghubungkan dengan repositori di github. Kemudian saya menjalankan perintah `git remote add origin https://github.com/freiazulaika/lahzadi-mobile.git` untuk menghubungkan direktori lokal dengan repositori di github.

### Membuat tiga tombol sederhana dengan ikon dan teks untuk melihat daftar produk, menambahkan produk, dan logout
1. Saya membuat berkas `menu.dart` dan menambahkan _class_ `myHomePage`.
2. Di dalam _class_ `myHomePage`, saya menambahkan kode berikut:
```
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.inventory, Colors.green[300]!),
    ItemHomepage("Tambah Produk", Icons.add, Colors.teal[400]!),
    ItemHomepage("Logout", Icons.logout, Colors.cyan[400]!),
  ];
```
Kode tersebut menunjukkan list tombol (termasuk ikon dan teks) yang akan ditampilkan.
3. Kemudian, saya membuat _class_/_widget_ `ItemCard` yang berisi kode berikut:
```
class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        onTap: () {
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
```
Di dalam _class_ ini, me-_return_ `Material` sehingga bentuk yang dihasilkan akan menyerupai card/tombol. Untuk membuat tombol ini bersifat interaktif, saya menggunakan `InkWell` yang dapat mendeteksi masukkan dari pengguna seperti tap.

### Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
1. Di _class_ `ItemHomePage`, saya membuat atribut-atribut berikut:
```
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
```
Color berfungsi untuk ketika saya membuat tombol, saya bisa langsung menentukan mau menggunakan warna apa.
2. Di kode berikut yang ada di `ItemCard`, saya menginisiasi tombol-tombol tersebut dengan warna yang berbeda:
```
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.inventory, Colors.green[300]!),
    ItemHomepage("Tambah Produk", Icons.add, Colors.teal[400]!),
    ItemHomepage("Logout", Icons.logout, Colors.cyan[400]!),
  ];
```

### Memunculkan Snackbar
1. Di _widget_ `ItemCard`, saya menambahkan kode berikut sehingga ketika pengguna tap tombolnya (onTap), maka akan keluar pesan Snackbar
```
onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
```

</details>
