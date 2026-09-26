# Kantor Google

Aplikasi Flutter sederhana berbahasa Indonesia untuk menjelajahi daftar kantor Google. Halaman daftar memakai `StatefulWidget` untuk pencarian dan filter wilayah; setiap kantor membuka halaman detail berisi lokasi, alamat, dan deskripsi.

Halaman `DetailPage` menampilkan nama, foto, alamat, wilayah, nomor telepon, latitude, dan longitude. Koordinat data contoh merupakan perkiraan lokasi; nomor telepon langsung kantor diberi keterangan tidak tersedia jika tidak dipublikasikan.

## Struktur Kode

- `lib/features/offices/domain`: entitas `Office`, kontrak `OfficeRepository`, dan use case `GetOffices`.
- `lib/features/offices/data`: sumber data lokal dan implementasi repository.
- `lib/features/offices/presentation`: `HomePage`, halaman detail, dan widget yang dapat digunakan ulang.
- `lib/app`: komposisi aplikasi dan tema.
- `lib/main.dart`: composition root yang menghubungkan data source, repository, dan use case.

## Menjalankan

Pasang Flutter SDK. Karena folder runner platform belum digenerate di workspace ini, jalankan sekali dari direktori proyek (pilih platform yang akan digunakan):

```sh
flutter create --platforms=android,web .
flutter pub get
flutter run -d chrome
```

Untuk menjalankan di emulator Android, gunakan `flutter run` setelah emulator aktif.

Untuk menjalankan pengujian widget:

```sh
flutter test
```

Foto pada daftar adalah gambar ilustrasi kota dari Unsplash dan dimuat melalui internet. Ganti URL pada data di `lib/features/offices/data/datasources/local_office_data_source.dart` dengan foto kantor resmi bila aset resmi tersedia.