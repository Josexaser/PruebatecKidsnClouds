import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// Esta es la pantalla de bienvenida de la app
class WelcomeScreen extends StatelessWidget {
  static const String name = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Fondo blanco
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0), // Márgenes a los lados
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra todo verticalmente
            children: [
              // Imagen de bienvenida
              const Image(
                image: AssetImage('assets/images/Bienvenidoa.png'),
                width: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24), // Espacio entre imagen y texto
              
              // Texto que dice lo que hace la app
              Text(
                'Accede a la agenda diaria de tus hijos.',
                style: GoogleFonts.fredoka(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48), // Más espacio antes del botón
              
              // Botón para entrar a la pantalla de la agenda
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  backgroundColor: Colors.indigo, // Color del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Bordes redondeados
                  ),
                ),
                onPressed: () {
                  // Cuando se toca el botón, navegamos a la agenda
                  context.go('/agenda_screen');
                },
                child: Text(
                  'Entrar como Miguel Scott',
                  style: GoogleFonts.fredoka(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 246, 246, 246),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
