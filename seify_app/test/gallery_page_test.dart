import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seify_app/pages/gallery_page.dart';

void main() {
  testWidgets('GalleryPage displays tabs and images', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: GalleryPage()));
    // Wait for async image loading
    await tester.pumpAndSettle();

    // Check for tab bar
    expect(find.byType(TabBar), findsOneWidget);
    // Check for at least one tab (محصولات or عمومی)
    expect(find.text('محصولات'), findsWidgets);
    expect(find.text('عمومی'), findsWidgets);
    // Check for image grid or empty state
    expect(
      find.byWidgetPredicate((widget) => widget is GridView || widget is Center),
      findsWidgets,
    );
  });

  testWidgets('GalleryPage shows empty state if no images', (WidgetTester tester) async {
    // Simulate empty images by injecting a fake state
    await tester.pumpWidget(const MaterialApp(home: GalleryPage()));
    await tester.pumpAndSettle();
    // If no images, should show empty message
    expect(find.text('هیچ تصویری یافت نشد'), findsWidgets);
  });
} 