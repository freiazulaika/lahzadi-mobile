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

<details>
<Summary><b>Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter</b></Summary>

## Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Membuat model untuk melakukan pengambilan dan pengiriman data JSON perlu dilakukan karena model dapat menjadi struktur atau _blueprint_ dari data yang akan dikirim atau diterima, sehingga akan menjadi lebih aman dan dapat membantu dalam pengelolaan dan validasi data. Model dapat menentukan data dan tipe data yang diinginkan serta dapat mengonversi JSON menjadi objek Dart dan sebaliknya, sehingga datanya akan menjadi lebih mudah dipahami dan mudah dikelola. Jika kita tidak membuat model, maka kita akan mengakses data JSON melalui key, yang bisa terjadi _error_ jika terdapat perubahan struktur data atau terdapat data yang tidak sesuai tipe. Selain itu, pengelolaan data juga akan menjadi kurang terjamin. Hal ini dapat menyebabkan aplikasi crash atau tidak berfungsi dengan benar saat memproses respons dari server.

## Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library http digunakan untuk memudahkan Flutter dalam melakukan komunikasi dengan server melalui protokol HTTP. Dengan library http, Flutter dapat menerima dan mengirim data dari server menggunakan metode HTTP seperti POST, GET, PUT, PATCH, dan DELETE. http juga dapat melakukan pengelolaan header, body, dan respons HTTP dengan mudah, sehingga kita dapat mengambil maupun mengirimkan data JSON serta melakukan autentikasi dengan server. Di dalam tugas ini, library http digunakan untuk mengintegrasikan Flutter dengan Django, sehingga dapat melakukan _request_ ke server, mengirimkan input dari pengguna, serta dapat mengimplementasikan fitur login, register, dan logout di aplikasi Flutter.

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah class yang digunakan untuk menangani _request_ HTTP yang memiliki kemampuan untuk mengelola cookie secara otomatis, contohnya seperti menyimpan session ID dan menyertakannya di setiap _request_ berikutnya. Fungsi dari cookie ini dapat menjaga agar sesi pengguna tetap aktif, melakukan autentikasi, dan mengelola data yang bergantung pada sesi, misalnya mengenai informasi login. Instance `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter karena `CookieRequest` dapat memastikan konsistensi dalam pengelolaan sesi. Dengan satu instance yang sama, semua bagian/fitur yang ada di aplikasi dapat merujuk dan berbagi dari data cookie yang tersimpan. Sehingga, _user_ tidak perlu melakukan login ulang atau kehilangan status sesi saat mengakses fitur-fitur lainnya.

## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Mekanisme pengiriman data dari input hingga bisa ditampilkan di Flutter:
1. User mengisi data melalui widget input yaitu TextField yang ada di aplikasi.
2. Selanjutnya, aplikasi akan memvalidasi agar format dan tipe datanya sesuai. Contoh memastikan bahwa `Harga` berisi angka > 0 dan buka berupa huruf. 
3. Setelah data yang dimasukkan sudah divalidasi, data tersebut akan diteruskan ke server menggunakan HTTP _request_ (biasanya POST atau PUT) dan menggunakan `CookieRequest` untuk menyertakan session ID.
4. Setelah data dikirim ke server, server Django akan menerima data dan memproses (misal ditambah ke database) dan mengirimkan respons dalam bentuk JSON.
5. Respons JSON ini akan diteruskan dan diterima oleh aplikasi Flutter. Respons JSON akan dikonversi menjadi Dart menggunakan method fromJson yang ada di file `product_entry.dart` dan `list_productentry.dart`
6. Data yang sudah dikonversi kemudian diproses untuk ditampilkan di UI aplikasi Flutter menggunakan widget ListView, Text, dan widget lainnya.

## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Mekanisme autentikasi login, register, dan logout:
a) _Register_
1. User mengisi data mengenai _username_, _password_, dan konfirmasi _password_ di dalam aplikasi Flutter.
2. Data dikirimkan ke server Django menggunakan _request_ HTTP POST.
3. Di Django, data divalidasi (seperti memastikan _username_ belum terdaftar dan _password_ yang dimasukkan sudah cocok).
4. Setelah di validasi, Django akan membuat akun pengguna dan menyimpannya di database. Kemudian, Django akan mengembalikan respons sukses.
```
  final response = await request.postJson(
    "http://127.0.0.1:8000/auth/register/",
    jsonEncode({
      "username": username,
      "password1": password1,
      "password2": password2,
    }));
if (context.mounted) {
  if (response['status'] == 'success') {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully registered!'),
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const LoginPage()),
    );
  } 
}
```

b) Login
1. Di form login aplikasi Flutter, _user_ memasukkan data _username_ dan _password_ yang sudah didaftarkan melalui proses _register_.
2. Data dikirimkan ke server Django menggunakan _request_ HTTP POST.
3. Server akan memvalidasi data dan mencari data di dalam _database_. Jika data ditemukan dan login berhasil, Django akan mengembalikan respons berupa cookie untuk menjaga autentikasi program.
```
final response = await request
    .login("http://127.0.0.1:8000/auth/login/", {
  'username': username,
  'password': password,
});

if (request.loggedIn) {
  String message = response['message'];
  String uname = response['username'];
  if (context.mounted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MyHomePage()),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
            content:
                Text("$message Selamat datang, $uname.")),
      );
  }
}
```
Pada implementasi kode saya, jika proses login sudah berhasil, maka aplikasi Flutter akan menunjukkan halaman MyHomePage dan akan muncul SnackBar berupa pasan "Selamat datang, {username}."

c) Logout
1. _User_ klik tombol logout.
2. Flutter mengirimkan HTTP request ke endpoint Django untuk menghapus _session_.
3. Django memproses logout dengan menghapus cookie session atau token yang digunakan untuk autentikasi.
4. Django mengembalikan respons sukses.
```
else if (item.name == "Logout") {
final response =
    await request.logout("http://127.0.0.1:8000/auth/logout/");
String message = response["message"];
if (context.mounted) {
  if (response['status']) {
    String uname = response["username"];
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message Sampai jumpa, $uname."),
    ));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
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
```

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
### Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
Deployment sudah dilakukan melalui PWS dan dapat diakses melalui [link berikut](http://freia-arianti-lahzadi.pbp.cs.ui.ac.id/).

### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
1. Di Django, saya membuat Django _app_ baru bernama `authentication`.

2. Saya menambahkan `django-cors-headers` di `requirements.txt` dan melakukan instalasi library menggunakan perintah `pip install django-cors-headers`

3. Di dalam berkas `settings.py` yang ada di _main project_, saya menambahkan `authentication` dan `corsheaders` di bagian `INSTALLED_APPS` serta menambahkan `corsheaders.middleware.CorsMiddleware` di `MIDDLEWARE`. Selain itu, saya juga menambahkan kode-kode berikut:
```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```

4. Di aplikasi `authentication`, saya membuat berkas `views.py` dan `urls.py` yang selanjutnya akan digunakan untuk proses registrasi, login, dan logout.

5. Saya menambahkan path berikut di lahzadi/urls.py:
```
path('auth/', include('authentication.urls')),
```

### Membuat halaman login pada proyek tugas Flutter.
1. Saya membuat halaman login bernama `login.dart` di lib/screens/ yang ada di aplikasi Flutter yang berisi kode untuk menampilkan halaman login:
```
import 'package:lahzadi/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:lahzadi/screens/register.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(secondary: Colors.teal[400]),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password = _passwordController.text;

                      // Cek kredensial
                      final response = await request
                          .login("http://127.0.0.1:8000/auth/login/", {
                        'username': username,
                        'password': password,
                      });

                      if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                  content:
                                      Text("$message Selamat datang, $uname.")),
                            );
                        }
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Login Gagal'),
                              content: Text(response['message']),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 36.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: Text(
                      'Belum memiliki akun? Daftar di sini!',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

2. Kemudian, di berkas `main.dart`, saya membuat agar proses ketika pertama kali mengakses aplikasi Flutter Lahzadi selalu muncul halaman login dengan mengubah `home: MyHomePage()` yang ada di `MaterialApp(...)` menjadi `home: const LoginPage()`.

3. Saya menambahkan view di Django untuk halaman login di `views.py` yang ada di `authentication` dengan kode berikut:
```
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "You have successfully logged in!"
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login failed: Account is deactivated."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login failed: check your username and/or password."
        }, status=401)
```

4. Di `authentication`/`urls.py`, saya menambahkan path untuk login:
```
path('login/', login, name='login'),
```

### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
1. Saya membuat halaman login bernama `register.dart` di lib/screens/ yang ada di aplikasi Flutter yang berisi kode untuk menampilkan halaman login:
```
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lahzadi/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password1 = _passwordController.text;
                      String password2 = _confirmPasswordController.text;

                      // Cek kredensial
                      final response = await request.postJson(
                          "http://127.0.0.1:8000/auth/register/",
                          jsonEncode({
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                          }));
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully registered!'),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to register!'),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

2. Saya menambahkan view di Django untuk halaman login di `views.py` yang ada di `authentication` dengan kode berikut:
```
from django.contrib.auth.models import User

@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
    
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)
```

3. Di `authentication`/`urls.py`, saya menambahkan path untuk register:
```
path('register/', register, name='register'),
```

### Membuat model kustom sesuai dengan proyek aplikasi Django.
1. Dari data _endpoint_ JSON yang sudah didapatkan melalui Django, saya menggunakan Quicktype untuk mendapatkan model yang sesuai dengan data-data yang sudah dimiliki sebelumnya.
```
import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
    json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String model;
  String pk;
  Fields fields;

  ProductEntry({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  String name;
  int price;
  String description;
  int stock;
  int size;
  int user;

  Fields({
    required this.name,
    required this.price,
    required this.description,
    required this.stock,
    required this.size,
    required this.user,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        stock: json["stock"],
        size: json["size"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "stock": stock,
        "size": size,
        "user": user,
      };
}
```

### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
#### Tampilkan name, price, dan description dari masing-masing item pada halaman ini.
1. Saya membuat _file_ berama `list_productentry.dart` yang berisi kode untuk menampilkan halaman berisi semua produk yang dimiliki seorang pengguna. Data yang ditampilkan berupa name, price, dan description, serta terdapat tombol untuk membuka halaman berisi data produk yang lebih lengkap.
```
import 'package:flutter/material.dart';
import 'package:lahzadi/models/product_entry.dart';
import 'package:lahzadi/widgets/left_drawer.dart';
import 'package:lahzadi/screens/detail_product.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPage();
}

class _ProductEntryPage extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');

    var data = response;

    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data produk pada Lahzadi.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Menampilkan nama produk
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Menampilkan harga produk
                      Text(
                        "Harga Produk: ${snapshot.data![index].fields.price}",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 10),
                      // Menampilkan deskripsi produk
                      Text(
                        "Harga Produk: ${snapshot.data![index].fields.description}",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 10),
                      // Tombol untuk navigasi ke halaman detail
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                        child: const Text('Lihat Detail Produk'),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
```

### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
Saya membuat berkas bernama `detail_product.dart` yang berisi data lengkap dari suatu produk, mencakup nama, deskripsi, harga, stok, dan ukuran.

#### Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
Di berkas `list_productentry.dart`-yang berisi semua daftar item-, saya membuat tombol dengan tulisan 'Lihat Detail Produk' yang jika ditekan akan menuju berkas `detail_product.dart`.
```
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(
          product: snapshot.data![index],
        ),
      ),
    );
  },
  child: const Text('Lihat Detail Produk'),
),
```

#### Tampilkan seluruh atribut pada model item kamu pada halaman ini.
Di dalam berkas `detail_product.dart`, saya menambahkan semua informasi lengkap yang akan ditampilkan:
```
import 'package:flutter/material.dart';
import 'package:lahzadi/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Harga Produk: ${product.fields.price}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10),
            Text(
              "Jumlah Produk: ${product.fields.stock}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10),
            Text(
              "Deskripsi Produk: ${product.fields.description}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10),
            Text(
              "Ukuran Produk: ${product.fields.size}",
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### Tambahkan tombol untuk kembali ke halaman daftar item.
Karena sebelumnya saya menggunakan perintah `Navigator.push()` di halaman daftar Item dan di halaman detail produk menggunakan AppBar, maka terdapat tombol kembali(<) otomatis yang sudah terdapat di AppBar.

### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
Item yang ditampilkan hanya item yang terasosiasikan dengan pengguna yang login dapat diakses dengan menggunakan `CookieRequest` saat akan melakukan `request.get()`. Sehingga, produk yang diambil dari database hanya produk yang sesuai dengan sesi yang dimiliki oleh pengguna.
```
Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
  final response = await request.get('http://127.0.0.1:8000/json/');
}
```

</details>