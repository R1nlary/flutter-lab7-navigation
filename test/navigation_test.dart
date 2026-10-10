import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_lab7_navigation/main.dart';
import 'package:flutter_lab7_navigation/screens/detail_screen.dart';

void main() {
  Future<void> openApp(WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const MyApp());
  }

  testWidgets('feed shows the tours with title and price', (tester) async {
    await openApp(tester);

    expect(find.text('Norway Fjord Cruise'), findsOneWidget);
    expect(find.text('Sea • \$650'), findsOneWidget);
    expect(find.byType(Image), findsWidgets);
  });

  testWidgets('tapping a tour opens the DetailScreen with its data', (
    tester,
  ) async {
    await openApp(tester);

    await tester.tap(find.text('Norway Fjord Cruise'));
    await tester.pumpAndSettle();

    expect(find.byType(DetailScreen), findsOneWidget);
    expect(find.textContaining('Sail between steep mountains'), findsOneWidget);
    expect(find.text('Sea'), findsOneWidget);
    expect(find.text('\$650'), findsOneWidget);
  });

  testWidgets('AppBar back arrow returns to the feed', (tester) async {
    await openApp(tester);

    await tester.tap(find.text('Norway Fjord Cruise'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.byType(DetailScreen), findsNothing);
    expect(find.text('Feed'), findsWidgets);
  });

  testWidgets('in-body Back button returns to the feed', (tester) async {
    await openApp(tester);

    await tester.tap(find.text('Forest Waterfall Hike'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(OutlinedButton, 'Back'));
    await tester.pumpAndSettle();

    expect(find.byType(DetailScreen), findsNothing);
  });

  testWidgets('going back keeps the app state (favorites and tab)', (
    tester,
  ) async {
    await openApp(tester);

    // Save a tour from the feed, then open and close another one.
    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pump();
    await tester.tap(find.text('Forest Waterfall Hike'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(OutlinedButton, 'Back'));
    await tester.pumpAndSettle();

    // The saved tour is still saved.
    await tester.tap(find.text('Favorites').last);
    await tester.pump();
    expect(find.text('Norway Fjord Cruise'), findsOneWidget);
    expect(find.text('Forest Waterfall Hike'), findsNothing);
  });

  testWidgets('favorites tab is empty at first and shows saved items', (
    tester,
  ) async {
    await openApp(tester);

    await tester.tap(find.text('Favorites').last);
    await tester.pump();
    expect(find.textContaining('No favorites yet'), findsOneWidget);

    await tester.tap(find.text('Feed').last);
    await tester.pump();
    await tester.tap(find.byIcon(Icons.favorite_border).at(1));
    await tester.pump();

    await tester.tap(find.text('Favorites').last);
    await tester.pump();
    expect(find.text('Forest Waterfall Hike'), findsOneWidget);
  });

  testWidgets('profile tab has working switches', (tester) async {
    await openApp(tester);

    await tester.tap(find.text('Profile').last);
    await tester.pump();

    expect(find.text('Aibek Nurlan'), findsOneWidget);
    await tester.tap(
      find.widgetWithText(SwitchListTile, 'Weekly email digest'),
    );
    await tester.pump();
    final tile = tester.widget<SwitchListTile>(
      find.widgetWithText(SwitchListTile, 'Weekly email digest'),
    );
    expect(tile.value, isTrue);
  });
}
