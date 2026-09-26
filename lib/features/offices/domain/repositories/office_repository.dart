import '../entities/google_office.dart';

abstract interface class OfficeRepository {
  List<GoogleOffice> getOffices();
}