# 🚀 Bengkelin - Aplikasi Manajemen Bengkel Berbasis Web 🔥

**Bengkelin** adalah sebuah sistem informasi manajemen berbasis web yang dikembangkan menggunakan bahasa pemrograman Java. Proyek ini dirancang sebagai solusi digital modern untuk membantu operasional harian bengkel servis motor, mulai dari pendataan pelanggan, pengelolaan stok spare part, hingga pencatatan transaksi servis secara akurat dan efisien.


## ✨ Fitur Utama

Bengkelin menyediakan fitur lengkap untuk mendukung operasional bengkel, mulai dari **manajemen data pelanggan dan spare part** (CRUD), **pencatatan transaksi servis otomatis** dengan diskon member, hingga **manajemen stok real-time**. Aplikasi ini juga dilengkapi **laporan dinamis** seperti transaksi per periode, penggunaan spare part, dan peringkat spare part terlaris untuk membantu pengambilan keputusan berbasis data.


## 🛠️ Teknologi yang Digunakan (Tech Stack)

| Kategori   | Teknologi                                  |
| ---------- | ------------------------------------------ |
| Backend    | Java, Java Servlet, JSP, JSTL              |
| Frontend   | HTML, CSS, Bootstrap 5, jQuery, Select2.js |
| Database   | MySQL                                      |
| Build Tool | Apache Maven                               |
| Server     | Apache Tomcat                              |


## ⚙️ Panduan Instalasi & Menjalankan Proyek

### 🔧 Prasyarat

Pastikan perangkat Anda telah terpasang perangkat lunak berikut:

* **JDK** versi 17 atau lebih baru
* **Apache Maven**
* **MySQL Server**
* **Apache Tomcat** versi 8.5 atau lebih baru

### 📦 Langkah Instalasi

1. **Clone Repositori**
   Salin repositori ke komputer lokal Anda, kemudian masuk ke direktori proyek:

   ```bash
   git clone https://github.com/RozhakXD/Bengkelin.git
   cd Bengkelin
   ```

2. **Pengaturan Database**
   Buat database baru (misalnya `bengkelin_db`) lalu impor skema dan data awal dari file `database.sql` yang tersedia di direktori utama proyek.

3. **Konfigurasi Koneksi Database**
   Buka file `src/main/java/com/bengkelin/util/DatabaseConnection.java`, lalu sesuaikan nilai dari `DB_URL`, `DB_USER`, dan `DB_PASSWORD` sesuai dengan konfigurasi database MySQL Anda.

4. **Build Proyek dengan Maven**
   Jalankan perintah berikut untuk membangun proyek dan mengunduh semua dependensi:

   ```bash
   mvn clean install
   ```

   File WAR akan dihasilkan di direktori `target` dengan nama `bengkelin-1.0-SNAPSHOT.war`.

5. **Deploy ke Server Tomcat**
   Salin file `.war` tersebut ke dalam folder `webapps` pada instalasi Apache Tomcat Anda. Setelah itu, jalankan server Tomcat.

6. **Akses Aplikasi**
   Setelah server berjalan, buka browser dan akses aplikasi melalui URL berikut:

   ```
   http://localhost:8080/
   ```

   (Sesuaikan port jika berbeda.)


## 📊 Preview Fitur Utama

1. **Halaman Dashboard**
   Menyajikan ringkasan informasi penting secara real-time, seperti total pelanggan, transaksi harian, serta notifikasi untuk item dengan stok menipis.

2. **Halaman Manajemen Transaksi**
   Menampilkan daftar transaksi yang telah dilakukan, dilengkapi dengan fitur filter berdasarkan rentang tanggal untuk kemudahan pencarian data.

3. **Formulir Transaksi Interaktif**
   Memungkinkan pembuatan transaksi baru dengan antarmuka yang intuitif, termasuk dropdown pencarian untuk memilih pelanggan dan spare part secara cepat.

4. **Halaman Detail Invoice**
   Menampilkan rincian lengkap dari transaksi yang telah dibuat, termasuk detail layanan, biaya, dan informasi pelanggan. Halaman ini siap untuk dicetak sebagai bukti transaksi.


## 📜 Lisensi
Proyek ini dilisensikan di bawah MIT License. Lihat file `LICENSE` untuk informasi lebih lanjut.