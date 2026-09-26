import '../../domain/entities/google_office.dart';
import '../../domain/repositories/office_repository.dart';
import '../datasources/local_office_data_source.dart';

class OfficeRepositoryImpl implements OfficeRepository {
  const OfficeRepositoryImpl({required this.dataSource});

  final LocalOfficeDataSource dataSource;

  @override
  List<GoogleOffice> getOffices() => dataSource.getOffices();
}