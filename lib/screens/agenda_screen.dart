import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens_export.dart'; // Aquí importamos todos los widgets y pantallas que vamos a usar

// Esta es la clase de la pantalla principal de la agenda
class AgendaScreen extends StatefulWidget {
  static const String name = 'agenda_screen';

  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  Child? selectedChild; // Aquí guardamos qué niño está seleccionado
  EventCategory? selectedCategory; // Aquí guardamos qué categoría está seleccionada

  // Función que se llama cuando el usuario selecciona un niño
  void handleChildSelected(Child? child) {
    setState(() {
      selectedChild = child;
    });
  }

  // Función que se llama cuando el usuario selecciona una categoría
  void handleCategorySelected(EventCategory? category) {
    setState(() {
      selectedCategory = category;
    });
  }

  // Esto muestra un chat flotante cuando se toca el botón
  void _showChatModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const ChatModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false, // Para que la AppBar no tape los widgets
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // Título de la AppBar con fuente personalizada
        title: Text(
          'Agenda Diaria',
          style: GoogleFonts.fredoka(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        // Fondo degradado para la AppBar
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF7FC8F8),
                Color(0xFFB5E3FF),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      // Botón flotante que abre el chat
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showChatModal(context),
        backgroundColor: Colors.tealAccent.shade700,
        child: const Icon(Icons.chat_bubble_outline),
      ),
      body: Column(
        children: [
          // Parte superior donde está el selector de hijos y categorías
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF7FC8F8),
                  Color(0xFFB5E3FF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                // Widget con el nombre del padre y el dropdown de hijos
                Header(
                  children: mockChildren,
                  selectedChild: selectedChild,
                  onChildSelected: handleChildSelected,
                ),
                const SizedBox(height: 8),
                // Widget con los filtros de categorías
                CategorySelector(
                  selectedCategory: selectedCategory,
                  onCategorySelected: handleCategorySelected,
                ),
                const Divider(),
              ],
            ),
          ),
          // Parte de abajo donde se ven los eventos
          Expanded(
            child: Stack(
              children: [
                // Fondo de imagen
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/LogoKC.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                // Lista de eventos encima del fondo
                Container(
                  color: Colors.white.withOpacity(0.75),
                  child: EventList(
                    children: mockChildren,
                    events: mockEvents,
                    selectedChild: selectedChild,
                    selectedCategory: selectedCategory,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
