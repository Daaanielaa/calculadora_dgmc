import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculadora/main.dart';

void main() {
  testWidgets('Calculator functionality test', (WidgetTester tester) async {
    // Construir la aplicación.
    await tester.pumpWidget(CalculatorApp());

    // Verificar que la pantalla comienza con '0'.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tocar el botón '1' y '+'.
    await tester.tap(find.text('1'));
    await tester.pump();

    await tester.tap(find.text('+'));
    await tester.pump();

    // Tocar el botón '1' y '='.
    await tester.tap(find.text('1'));
    await tester.pump();

    await tester.tap(find.text('='));
    await tester.pump();

    // Verificar que la suma es correcta.
    expect(find.text('2'), findsOneWidget);
  });
}
