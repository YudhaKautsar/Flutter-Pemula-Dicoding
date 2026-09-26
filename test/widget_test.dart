import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_office_directory/app/google_offices_app.dart';
import 'package:google_office_directory/features/offices/data/datasources/local_office_data_source.dart';
import 'package:google_office_directory/features/offices/data/repositories/office_repository_impl.dart';
import 'package:google_office_directory/features/offices/presentation/pages/office_detail_page.dart';
import 'package:google_office_directory/features/offices/domain/usecases/get_offices.dart';
import 'package:google_office_directory/l10n/generated/app_localizations.dart';

GetOffices buildGetOffices() {
  final dataSource = LocalOfficeDataSource();
  final repository = OfficeRepositoryImpl(dataSource: dataSource);
  return GetOffices(repository);
}

GoogleOfficesApp buildApp() {
  return GoogleOfficesApp(getOffices: buildGetOffices());
}

void main() {
  testWidgets('detail content scrolls on a short screen with decorated image',
      (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 420);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    final getOffices = buildGetOffices();
    final googleOffice = getOffices().first;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: DetailPage(
          googleOfficeId: googleOffice.id,
          getOffices: getOffices,
        ),
      ),
    );

    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            widget.child is Image,
      ),
      findsOneWidget,
    );

    await tester.drag(
        find.byType(SingleChildScrollView), const Offset(0, -900));
    await tester.pumpAndSettle();

    expect(find.text('Longitude'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('switches to a grid only above 700 pixels', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(700, 900);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(buildApp());
    expect(find.byType(GridView), findsNothing);

    tester.view.physicalSize = const Size(701, 900);
    await tester.pump();
    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets('home displays ten offices with addresses and images',
      (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(700, 900);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(buildApp());

    final offices = LocalOfficeDataSource().getOffices();
    expect(offices, hasLength(10));
    expect(offices.map((office) => office.id).toSet(), hasLength(10));
    expect(
      offices.every((office) =>
          (office.phoneNumber == null || office.phoneNumber!.isNotEmpty) &&
          office.latitude >= -90 &&
          office.latitude <= 90 &&
          office.longitude >= -180 &&
          office.longitude <= 180),
      isTrue,
    );
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is ListView && widget.scrollDirection == Axis.vertical,
      ),
      findsOneWidget,
    );
    expect(find.text('1600 Amphitheatre Parkway, Mountain View, CA'),
        findsOneWidget);
    expect(find.byType(Image), findsWidgets);
  });

  testWidgets('search filters the office list', (tester) async {
    await tester.pumpWidget(buildApp());

    expect(find.text('Googleplex'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Singapore');
    await tester.pump();

    expect(find.text('Google Singapore'), findsOneWidget);
    expect(find.text('Googleplex'), findsNothing);
    expect(find.text('1 kantor'), findsOneWidget);
  });

  testWidgets('search matches office addresses', (tester) async {
    await tester.pumpWidget(buildApp());

    await tester.enterText(
        find.byType(TextField), '  mapletree business city  ');
    await tester.pump();

    expect(find.text('Google Singapore'), findsOneWidget);
    expect(find.text('Googleplex'), findsNothing);
    expect(find.text('1 kantor'), findsOneWidget);
  });

  testWidgets('tapping an office opens its detail page', (tester) async {
    await tester.pumpWidget(buildApp());

    await tester.tap(
      find.ancestor(
        of: find.text('Googleplex'),
        matching: find.byType(InkWell),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 80));
    expect(find.byType(SlideTransition), findsWidgets);
    expect(
      tester
          .widgetList<SlideTransition>(find.byType(SlideTransition))
          .any((transition) => transition.position.value.dy > 0),
      isTrue,
    );
    await tester.pumpAndSettle();

    expect(find.byType(DetailPage), findsOneWidget);
    final detailPage = tester.widget<DetailPage>(find.byType(DetailPage));
    expect(detailPage, isA<StatelessWidget>());
    expect(detailPage.googleOfficeId, 'googleplex');
    expect(detailPage.googleOffice.name, 'Googleplex');
    expect(find.text('KANTOR GOOGLE'), findsOneWidget);
    expect(find.text('Mountain View, Amerika Serikat'), findsOneWidget);
    expect(find.text('Tentang kantor'), findsOneWidget);
    expect(find.text('Alamat kantor'), findsOneWidget);
    expect(find.text('Nomor telepon'), findsOneWidget);
    expect(find.text('Kontak publik tidak tersedia'), findsOneWidget);
    expect(find.text('Latitude'), findsOneWidget);
    expect(find.text('37.4220'), findsOneWidget);
    expect(find.text('Longitude'), findsOneWidget);
    expect(find.text('-122.0841'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('1600 Amphitheatre Parkway, Mountain View, CA'),
        findsOneWidget);
  });
}
