import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seify_app/pages/static_content_page.dart';

void main() {
  testWidgets('StaticContentPage displays title and content', (WidgetTester tester) async {
    const testTitle = 'درباره ما';
    const testContent = 'این یک متن تستی است.';
    await tester.pumpWidget(const MaterialApp(
      home: StaticContentPage(title: testTitle, content: testContent),
    ));
    expect(find.text(testTitle), findsOneWidget);
    expect(find.text(testContent), findsOneWidget);
  });
} 