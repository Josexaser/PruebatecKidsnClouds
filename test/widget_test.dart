import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:agenda_diaria/widgets/header.dart';
import 'package:agenda_diaria/models/child.dart';



void main() {
  testWidgets('Header muestra nombre del padre y lista de hijos', (WidgetTester tester) async {
    //  lista de hijos de prueba
    final mockChildren = [
      Child(id: '1', name: 'Jim Halpert', imageUrl: ''),
      Child(id: '2', name: 'Pamela Beesly', imageUrl: ''),
      Child(id: '3', name: 'Dwight Schrute', imageUrl: ''),
      Child(id: '4', name: 'Andy Bernard', imageUrl: ''),
    ];

    // Widget Header dentro de un MaterialApp para el test
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Header(
            children: mockChildren,
            selectedChild: null, // Selección inicial nula
            onChildSelected: (_) {}, // Función de selección vacía para el test
          ),
        ),
      ),
    );

    // Se comprueba que el nombre del padre se ve correctamente
    expect(find.text('Miguel Scott'), findsOneWidget);

    // Simula un toque en el boton de selección de hijos
    await tester.tap(find.byType(DropdownButton<Child?>));
    await tester.pumpAndSettle(); // Se abre el menú desplegable

    // Se comprueba que los hijos aprarecen en el menú desplegable
    expect(find.text('Jim Halpert'), findsOneWidget);
    expect(find.text('Pamela Beesly'), findsOneWidget);
    expect(find.text('Dwight Schrute'), findsOneWidget);
    expect(find.text('Andy Bernard'), findsOneWidget);

    // Se pretende comprobar que existe la opción "Todos los hijos" en el menú
    expect(find.text('Todos los hijos'), findsAtLeastNWidgets(1));
  });
}
