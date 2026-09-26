import '../entities/google_office.dart';
import '../repositories/office_repository.dart';

class GetOffices {
  const GetOffices(this.repository);

  final OfficeRepository repository;

  List<GoogleOffice> call() => repository.getOffices();
}