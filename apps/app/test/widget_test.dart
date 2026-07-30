// Test básico de arranque para Aula Lid-IA.
//
// Verifica que la app inicia correctamente y muestra la pantalla de login.

import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('La app arranca y muestra la pantalla de login', (
    WidgetTester tester,
  ) async {
    // Construye la app y dispara un frame.
    await tester.pumpWidget(const AulaLidIAApp());

    // Verifica que el título "Aula Lid-IA" aparece en pantalla.
    expect(find.text('Aula Lid-IA'), findsOneWidget);

    // Verifica que el botón de "Iniciar sesión" está presente.
    expect(find.text('Iniciar sesión'), findsOneWidget);
  });
}
