import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/child.dart';
import '../models/event.dart';
import 'event_card.dart';

// Este widget muestra la lista de eventos
class EventList extends StatelessWidget {
  final List<Child> children; // Lista de todos los niños
  final List<Event> events; // Lista de todos los eventos
  final Child? selectedChild; // Niño seleccionado (si hay uno)
  final EventCategory? selectedCategory; // Categoría seleccionada (si hay una)

  const EventList({
    super.key,
    required this.children,
    required this.events,
    this.selectedChild,
    this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    // Filtra los eventos según el niño y la categoría seleccionada
    final filteredEvents = events.where((event) {
      final matchChild = selectedChild == null || event.childId == selectedChild!.id;
      final matchCategory = selectedCategory == null || event.category == selectedCategory;
      return matchChild && matchCategory;
    }).toList();

    // Si no hay eventos después de filtrar, mostramos un mensaje
    if (filteredEvents.isEmpty) {
      return Center(
        child: Text(
          "No hay eventos para mostrar",
          style: GoogleFonts.fredoka(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      );
    }

    // Si hay eventos, los mostramos en una lista
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: filteredEvents.length,
      itemBuilder: (context, index) {
        final event = filteredEvents[index];
        // Buscamos el niño al que pertenece el evento
        final child = children.firstWhere((c) => c.id == event.childId);

        // Mostramos el evento usando el widget EventCard
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: EventCard(child: child, event: event),
        );
      },
    );
  }
}
