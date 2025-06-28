import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/event.dart';

// Este widget es el selector de categorías
// Sirve para mostrar botones que permiten filtrar los eventos por tipo
class CategorySelector extends StatelessWidget {
  final EventCategory? selectedCategory; // Aquí guardamos qué categoría está seleccionada
  final Function(EventCategory?) onCategorySelected; // Esto se llama cuando el usuario toca una categoría

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    // Aquí obtenemos todas las categorías posibles (del enum EventCategory)
    final categories = EventCategory.values;

    return SizedBox(
      height: 48, // Altura del selector
      child: ListView(
        scrollDirection: Axis.horizontal, // Para que se pueda hacer scroll en horizontal
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          // Chip para mostrar la opción "Todas"
          ChoiceChip(
            label: Text(
              'Todas',
              style: GoogleFonts.fredoka(), // Fuente bonita
            ),
            selected: selectedCategory == null, // Está seleccionada si no hay categoría elegida
            onSelected: (_) => onCategorySelected(null), // Llama a la función cuando se toca
          ),
          const SizedBox(width: 8),
          // Creamos un chip para cada categoría
          ...categories.map(
            (category) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(
                  category.displayName, // Muestra el nombre de la categoría
                  style: GoogleFonts.fredoka(),
                ),
                selected: selectedCategory == category, // Activa si coincide con la seleccionada
                onSelected: (_) => onCategorySelected(category), // Cambia la categoría al tocarlo
              ),
            ),
          ),
        ],
      ),
    );
  }
}
