import 'package:flutter/material.dart';

import 'app/google_offices_app.dart';
import 'features/offices/data/datasources/local_office_data_source.dart';
import 'features/offices/data/repositories/office_repository_impl.dart';
import 'features/offices/domain/usecases/get_offices.dart';

void main() {
  final dataSource = LocalOfficeDataSource();
  final repository = OfficeRepositoryImpl(dataSource: dataSource);
  final getOffices = GetOffices(repository);

  runApp(GoogleOfficesApp(getOffices: getOffices));
}