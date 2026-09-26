import 'package:flutter/material.dart';

import '../features/offices/domain/usecases/get_offices.dart';
import '../features/offices/presentation/pages/home_page.dart';
import 'app_theme.dart';

class GoogleOfficesApp extends StatelessWidget {
  const GoogleOfficesApp({super.key, required this.getOffices});

  final GetOffices getOffices;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kantor Google',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: HomePage(getOffices: getOffices),
    );
  }
}