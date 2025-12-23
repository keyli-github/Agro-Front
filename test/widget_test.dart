// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/main.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    // Provide ProviderScope so ConsumerWidget (AgroApp) can access providers
    await tester.pumpWidget(const ProviderScope(child: AgroApp()));
    await tester.pumpAndSettle();

    // Verifica que MaterialApp esté presente
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
