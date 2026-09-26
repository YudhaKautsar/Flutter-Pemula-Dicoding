import 'package:flutter/material.dart';

import '../../../../l10n/generated/app_localizations.dart';

class EmptyResults extends StatelessWidget {
  const EmptyResults({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.location_off_outlined,
                size: 38, color: Color(0xFF74797D)),
            const SizedBox(height: 12),
            Text(localizations.emptyResultsTitle,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            Text(localizations.emptyResultsMessage,
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
