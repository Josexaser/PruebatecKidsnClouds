import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/child.dart';

// Este widget muestra la parte de arriba de la pantalla (el header)
class Header extends StatelessWidget {
  final List<Child> children; // Lista de niños
  final Child? selectedChild; // Niño seleccionado actualmente
  final Function(Child?) onChildSelected; // Función que se llama al cambiar de niño

  const Header({
    super.key,
    required this.children,
    required this.selectedChild,
    required this.onChildSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinea todo a la izquierda
      children: [
        // Aquí mostramos el nombre del padre
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            'Miguel Scott', // Nombre del padre fijo
            style: GoogleFonts.fredoka(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Aquí mostramos el Dropdown para seleccionar un hijo
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<Child?>(
            isExpanded: true, // Que ocupe todo el ancho
            value: selectedChild, // Niño seleccionado
            hint: Text(
              "Seleccionar hijo/a",
              style: GoogleFonts.fredoka(),
            ),
            items: [
              // Opción para ver todos los hijos
              DropdownMenuItem<Child?>(
                value: null,
                child: Text(
                  "Todos los hijos",
                  style: GoogleFonts.fredoka(),
                ),
              ),
              // Creamos una opción por cada niño en la lista
              ...children.map(
                (child) => DropdownMenuItem<Child?>(
                  value: child,
                  child: Text(
                    child.name,
                    style: GoogleFonts.fredoka(),
                  ),
                ),
              ),
            ],
            onChanged: onChildSelected, // Cuando el usuario elige uno, se llama esta función
          ),
        ),
      ],
    );
  }
}
