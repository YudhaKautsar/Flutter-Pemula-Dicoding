import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/google_office.dart';

extension OfficeRegionLocalization on OfficeRegion {
  String localizedName(AppLocalizations localizations) => switch (this) {
        OfficeRegion.americas => localizations.americasRegion,
        OfficeRegion.europe => localizations.europeRegion,
        OfficeRegion.asiaPacific => localizations.asiaPacificRegion,
      };
}
