# Kantor Google

Aplikasi Flutter sederhana berbahasa Indonesia untuk menjelajahi daftar kantor Google. Halaman daftar memakai `StatefulWidget` untuk pencarian dan filter wilayah; setiap kantor membuka halaman detail berisi lokasi, alamat, dan deskripsi.

Halaman `DetailPage` menampilkan nama, foto, alamat, wilayah, nomor telepon, latitude, dan longitude. Koordinat data contoh merupakan perkiraan lokasi; nomor telepon langsung kantor diberi keterangan tidak tersedia jika tidak dipublikasikan.

## Struktur Kode

- `lib/features/offices/domain`: entitas `GoogleOffice`, kontrak `OfficeRepository`, dan use case `GetOffices`.
- `lib/features/offices/data`: sumber data lokal dan implementasi repository.
- `lib/features/offices/presentation`: `HomePage`, halaman detail, dan widget yang dapat digunakan ulang.
- `lib/app`: komposisi aplikasi dan tema.
- `lib/main.dart`: composition root yang menghubungkan data source, repository, dan use case.

## Teks Antarmuka

Teks antarmuka disimpan di `lib/l10n/app_id.arb` dan diakses melalui `AppLocalizations`. Setelah menambahkan atau mengubah teks, perbarui file ARB lalu jalankan `flutter pub get` agar localization dihasilkan ulang. Data nama, alamat, deskripsi, dan gambar kantor tetap berada di local data source sebagai dataset contoh.

## Menjalankan

Pastikan Flutter SDK terpasang, lalu dari direktori proyek jalankan:

```sh
flutter pub get
flutter run -d chrome
```

Untuk menjalankan di emulator Android, gunakan `flutter run` setelah emulator aktif.

Untuk menjalankan pengujian widget:

```sh
flutter test
```

Foto pada daftar adalah gambar ilustrasi kota dari Unsplash dan dimuat melalui internet. Ganti URL pada data di `lib/features/offices/data/datasources/local_office_data_source.dart` dengan foto kantor resmi bila aset resmi tersedia.