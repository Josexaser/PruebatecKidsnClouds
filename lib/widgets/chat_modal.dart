import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Este widget muestra una ventanita de chat (un modal) que se abre encima de la pantalla
class ChatModal extends StatelessWidget {
  const ChatModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Bordes redondeados del modal
      child: Padding(
        padding: const EdgeInsets.all(16), // Espacio interno del contenido
        child: SizedBox(
          width: 300, // Ancho fijo de la ventanita
          child: Column(
            mainAxisSize: MainAxisSize.min, // Solo ocupa lo que necesita
            children: [
              // Icono de asistente (como una imagen de perfil)
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.tealAccent,
                child: Icon(Icons.support_agent, size: 30, color: Colors.white),
              ),
              const SizedBox(height: 12), // Espacio
              // Mensaje de bienvenida en la cabecera
              Text(
                "¿En qué puedo ayudarte?",
                style: GoogleFonts.fredoka(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // Primer mensaje del asistente
              Align(
                alignment: Alignment.centerLeft,
                child: ChatBubble(
                  text: "Hola, soy el tutor de tus hijos.",
                  isBot: true, // Indicamos que este mensaje es del bot
                ),
              ),
              const SizedBox(height: 12),
              // Campo de texto para que el usuario escriba su mensaje
              TextField(
                style: GoogleFonts.fredoka(),
                decoration: InputDecoration(
                  hintText: "Que necesitas saber?", // Texto de ayuda en el campo
                  hintStyle: GoogleFonts.fredoka(),
                  suffixIcon: const Icon(Icons.send), // Icono de enviar
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // Bordes redondeados
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget para mostrar un mensaje dentro del chat (una burbujita de texto)
class ChatBubble extends StatelessWidget {
  final String text; // El mensaje
  final bool isBot; // Si el mensaje es del bot o del usuario

  const ChatBubble({super.key, required this.text, required this.isBot});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        // Cambia el color según si es bot o usuario
        color: isBot ? Colors.tealAccent.shade100 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: GoogleFonts.fredoka(),
      ),
    );
  }
}
