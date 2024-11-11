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

<details>
<Summary><b>Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements</b></Summary>

## Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
`const` dalam Flutter sangat penting untuk digunakan karena dapat meningkatkan efisiensi dan performa aplikasi. `const` digunakan untuk nilai atau _widget_ yang bersifat tetap/konstan dan tidak akan berubah selama _runtime_. Sehingga, Flutter dapat membuat objek hanya sekali, disimpan di memori, dan kita dapat menggunakannya kembali tanpa perlu membuat ulang. Penggunaan ini dapat membuat kita dalam menghemat memori dan mempercepat proses _rendering_. Selain itu, `const` dapat membantu mempercepat waktu _build_, mengurangi penggunaan CPU, dan mampu menciptakan aplikasi yang lebih responsif. `const` juga memiliki sifat yang _immutable_, jadi dapat membuat kode lebih mudah diprediksi, stabil, dan lebih mudah di-debug. Karena memiliki sifat _immutable_, `const` tidak cocok untuk digunakan dalam _widget_ yang bersifat dinamis seperti input pengguna.

## Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
_Widget_ Column dan Row digunakan untuk menyusun _child widget_ dalam arah tertentu. Column menyusun _child_ secara vertikal dari atas ke bawah, sedangkan Row menyusun _child_ secara horizontal dari kiri ke kanan. Keduanya memiliki properti `mainAxisAlignment` untuk mengatur letak _child_ di sepanjang sumbu utama (vertikal untuk Column dan horizontal untuk Row) dan `crossAxisAlignment` untuk sumbu sebaliknya. Perbedaannya, Column lebih cocok untuk _layout_ seperti daftar yang berurutan ke bawah atau halaman yang membutuhkan _scrolling_, sedangkan Row lebih cocok untuk susunan horizontal seperti baris ikon atau tombol.
```
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Nama: $_name'),
    Text('Jumlah: $_amount'),
    Text('Deskripsi: $_description'),
    Text('Harga: $_price'),
    Text('Ukuran: $_size'),
  ],
),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: name),
    InfoCard(title: 'Class', content: className),
  ],
),
```

## Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Elemen input yang saya gunakan di halaman form yaitu `TextFormField` itu menerima semua input (nama, jumlah, deskripsi, harga, dan ukuran). Namun, terdapat elemen input lain seperti `Checkbox` untuk menerima input berupa boolean, `Radio` untuk menerima tepat satu input dari beberapa pilihan, `DropdownButtonFormField` untuk menerima input berupa pilihan dari daftar, dan `Slider` untuk menerima input nilai dalam sebuah rentang seperti ukuran.

## Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Di dalam aplikasi saya, saya menggunakan `ThemeData` yang ada di berkas `main.dart` di _widget_ `MaterialApp`. Di bagian ini, tema saya didefinisikan dengan `colorScheme` menggunakan `ColorScheme.fromSwatch` dan warna utama dari aplikasi saya adalah teal.

## Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Navigasi diatur menggunakan `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`. `Navigator.push()` digunakan untuk menambahkan halaman ke _stack_ Navigator. Halaman akan ditambahkan di bagian paling atas dari stack dan halaman tersebut-lah yang akan ditampilkan ke pengguna. Halaman sebelumnya akan tetap ada di stack dan tetap dapat diakses oleh pengguna ketika pengguna memilih untuk kembali.

`Navigator.pushReplacement()`digunakan untuk menambahkan halaman ke stack Navigator namun sebelumnya menghapus halaman yang ada di paling atas dari stack. Misal kita memiliki stack berisi ['Page1', 'Page2', 'Page3'], ketika melakukan `Navigator.pushReplacement()` pada 'Page4', maka stack akan berisi ['Page1', 'Page2', 'Page4']. Setelah melakukan pushReplacement, halaman yang di-push akan ditampilkan ke pengguna. Jika pengguna berada di 'Page4' dan mau mengakses halaman sebelumnya, maka akan masuk ke 'Page2'

`Navigator.pop()` digunakan untuk menghapus halaman yang sedang kita tampilkan dari stack Navigator. Setelah melakukan pop, halaman akan pindah ke halaman yang ada di bawah halaman yang di-pop tadi.
</details>
