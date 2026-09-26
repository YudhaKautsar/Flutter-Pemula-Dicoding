import 'package:flutter/material.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/google_office.dart';
import '../../domain/usecases/get_offices.dart';
import '../extensions/office_region_localization.dart';
import '../widgets/empty_results.dart';
import '../widgets/google_wordmark.dart';
import '../widgets/office_tile.dart';
import 'office_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.getOffices});

  final GetOffices getOffices;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const regionValues = <OfficeRegion?>[
    null,
    OfficeRegion.americas,
    OfficeRegion.europe,
    OfficeRegion.asiaPacific,
  ];

  final searchController = TextEditingController();
  late final List<GoogleOffice> offices;
  OfficeRegion? selectedRegion;
  String searchQuery = '';

  List<GoogleOffice> get filteredOffices {
    final query = searchQuery.trim().toLowerCase();

    return offices.where((office) {
      final matchesRegion =
          selectedRegion == null || office.region == selectedRegion;
      final matchesSearch = query.isEmpty ||
          office.name.toLowerCase().contains(query) ||
          office.location.toLowerCase().contains(query) ||
          office.address.toLowerCase().contains(query);
      return matchesRegion && matchesSearch;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    offices = widget.getOffices();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Widget _buildOfficeTile(BuildContext context, GoogleOffice office) {
    return OfficeTile(
      office: office,
      onTap: () => Navigator.push<void>(
        context,
        PageRouteBuilder<void>(
          transitionDuration: const Duration(milliseconds: 360),
          reverseTransitionDuration: const Duration(milliseconds: 260),
          pageBuilder: (context, animation, secondaryAnimation) => DetailPage(
            googleOfficeId: office.id,
            getOffices: widget.getOffices,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final slideAnimation = Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeOutCubic)).animate(animation);

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: slideAnimation,
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final visibleOffices = filteredOffices;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GoogleWordmark(),
                  const SizedBox(height: 22),
                  Text(localizations.homeTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 7),
                  Text(
                    localizations.homeSubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    controller: searchController,
                    onChanged: (value) => setState(() => searchQuery = value),
                    decoration: InputDecoration(
                      hintText: localizations.searchHint,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: searchQuery.isEmpty
                          ? null
                          : IconButton(
                              tooltip: localizations.clearSearch,
                              onPressed: () {
                                searchController.clear();
                                setState(() => searchQuery = '');
                              },
                              icon: const Icon(Icons.close),
                            ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 38,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: regionValues.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final region = regionValues[index];
                        final regionLabel =
                            region?.localizedName(localizations) ??
                                localizations.allRegions;
                        return ChoiceChip(
                          label: Text(regionLabel),
                          selected: selectedRegion == region,
                          onSelected: (_) =>
                              setState(() => selectedRegion = region),
                          showCheckmark: false,
                          side: BorderSide.none,
                          backgroundColor: Colors.white,
                          selectedColor: const Color(0xFFDDEFE8),
                          labelStyle: TextStyle(
                            color: selectedRegion == region
                                ? const Color(0xFF17634F)
                                : const Color(0xFF5F6368),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 10),
              child: Row(
                children: [
                  Text(localizations.locationLabel,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF74797D),
                          )),
                  const Spacer(),
                  Text(localizations.officeCount(visibleOffices.length),
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (visibleOffices.isEmpty) {
                    return const EmptyResults();
                  }

                  if (constraints.maxWidth > 700) {
                    return GridView.builder(
                      padding: const EdgeInsets.fromLTRB(22, 0, 22, 24),
                      itemCount: visibleOffices.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 420,
                        mainAxisExtent: 124,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 11,
                      ),
                      itemBuilder: (context, index) => _buildOfficeTile(
                        context,
                        visibleOffices[index],
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.fromLTRB(22, 0, 22, 24),
                    itemCount: visibleOffices.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 11),
                    itemBuilder: (context, index) => _buildOfficeTile(
                      context,
                      visibleOffices[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
