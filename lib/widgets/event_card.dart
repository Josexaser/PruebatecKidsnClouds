import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/child.dart';
import '../models/event.dart';
import 'package:intl/intl.dart';

// Este widget muestra una tarjeta con info de un evento de un niño
class EventCard extends StatelessWidget {
  final Child child; // El niño al que pertenece el evento
  final Event event; // El evento en sí

  const EventCard({
    super.key,
    required this.child,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    // Formatea la hora del evento (ej: 14:30)
    final timeFormatted = DateFormat.Hm().format(event.time);

    return Card(
      color: Colors.white.withOpacity(0.85), // Fondo blanco con un poco de transparencia
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Margen alrededor
      elevation: 4, // Sombra
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Bordes redondeados
      child: ListTile(
        // Foto del niño
        leading: CircleAvatar(
          backgroundImage: NetworkImage(child.imageUrl),
        ),
        // Nombre del niño
        title: Text(
          child.name,
          style: GoogleFonts.fredoka(fontWeight: FontWeight.bold),
        ),
        // Detalles del evento
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              timeFormatted, // Hora del evento
              style: GoogleFonts.fredoka(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4), // Espacio entre hora y descripción
            Text(
              event.description, // Descripción del evento
              style: GoogleFonts.fredoka(),
            ),
          ],
        ),
      ),
    );
  }
}
