import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/google_office.dart';
import '../../domain/usecases/get_offices.dart';
import '../extensions/office_region_localization.dart';
import '../widgets/image_fallback.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    super.key,
    required this.googleOfficeId,
    required GetOffices getOffices,
  }) : googleOffice = getOffices().firstWhere(
          (office) => office.id == googleOfficeId,
        );

  final String googleOfficeId;
  final GoogleOffice googleOffice;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          googleOffice.name,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 260,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xFFE3ECE8),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFD9E2DE)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A202124),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Image.network(
                googleOffice.imageUrl,
                fit: BoxFit.cover,
                semanticLabel:
                    localizations.officeImageDescription(googleOffice.name),
                errorBuilder: (_, __, ___) => const ImageFallback(),
              ),
            ),
            const SizedBox(height: 24),
            Text(localizations.googleOfficeLabel,
                style: const TextStyle(
                  color: Color(0xFF287A65),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(height: 8),
            Text(
              googleOffice.name,
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _OfficeDetailBadge(
                  icon: Icons.location_city_outlined,
                  label: googleOffice.location,
                ),
                _OfficeDetailBadge(
                  icon: Icons.public_outlined,
                  label: googleOffice.region.localizedName(localizations),
                ),
              ],
            ),
            const SizedBox(height: 26),
            const Divider(height: 1),
            const SizedBox(height: 22),
            Text(localizations.aboutOffice,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            Text(googleOffice.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                    )),
            const SizedBox(height: 24),
            Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading:
                    const Icon(Icons.place_outlined, color: Color(0xFF287A65)),
                title: Text(localizations.officeAddress),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(googleOffice.address),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.call_outlined,
                        color: Color(0xFF287A65)),
                    title: Text(localizations.phoneNumber),
                    subtitle: Text(
                      googleOffice.phoneNumber ??
                          localizations.phoneUnavailable,
                    ),
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  ListTile(
                    leading: const Icon(Icons.explore_outlined,
                        color: Color(0xFF287A65)),
                    title: Text(localizations.latitude),
                    subtitle: Text(googleOffice.latitude.toStringAsFixed(4)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.explore_outlined,
                        color: Color(0xFF287A65)),
                    title: Text(localizations.longitude),
                    subtitle: Text(googleOffice.longitude.toStringAsFixed(4)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OfficeDetailBadge extends StatelessWidget {
  const _OfficeDetailBadge({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width - 44,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE1E7E4)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 17, color: const Color(0xFF287A65)),
              const SizedBox(width: 7),
              Flexible(
                child: Text(
                  label,
                  softWrap: true,
                  style: const TextStyle(
                    color: Color(0xFF3C4043),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
