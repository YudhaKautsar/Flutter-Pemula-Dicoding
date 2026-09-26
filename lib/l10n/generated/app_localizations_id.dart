// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Kantor Google';

  @override
  String get homeTitle => 'Kantor Google';

  @override
  String get homeSubtitle => 'Jelajahi ruang kerja kami di seluruh dunia.';

  @override
  String get searchHint => 'Cari kota atau kantor';

  @override
  String get clearSearch => 'Hapus pencarian';

  @override
  String get allRegions => 'Semua';

  @override
  String get americasRegion => 'Amerika';

  @override
  String get europeRegion => 'Eropa';

  @override
  String get asiaPacificRegion => 'Asia Pasifik';

  @override
  String get locationLabel => 'LOKASI';

  @override
  String officeCount(int count) {
    return '$count kantor';
  }

  @override
  String get emptyResultsTitle => 'Kantor tidak ditemukan';

  @override
  String get emptyResultsMessage => 'Coba kata kunci atau wilayah lain.';

  @override
  String get googleOfficeLabel => 'KANTOR GOOGLE';

  @override
  String officeImageDescription(Object officeName) {
    return 'Foto ilustrasi $officeName';
  }

  @override
  String get aboutOffice => 'Tentang kantor';

  @override
  String get officeAddress => 'Alamat kantor';

  @override
  String get phoneNumber => 'Nomor telepon';

  @override
  String get phoneUnavailable => 'Kontak publik tidak tersedia';

  @override
  String get latitude => 'Latitude';

  @override
  String get longitude => 'Longitude';
}
