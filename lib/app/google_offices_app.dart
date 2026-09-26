import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../features/offices/domain/usecases/get_offices.dart';
import '../features/offices/presentation/pages/home_page.dart';
import 'app_theme.dart';

class GoogleOfficesApp extends StatelessWidget {
  const GoogleOfficesApp({super.key, required this.getOffices});

  final GetOffices getOffices;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomePage(getOffices: getOffices),
    );
  }
}
