import 'package:flutter/material.dart';
import 'package:agenda_diaria/theme/app_theme.dart';
import 'router/app_router.dart'; // Aquí importamos las rutas de la app

void main() {
  runApp(const MyApp()); // Esta es la función principal que arranca la app
}

// Este es el widget principal de toda la app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Aquí configuramos el tema (colores, etc)
    final theme = AppTheme(selectedColorIndex: 1).themeData();

    return MaterialApp.router(
      title: 'Agenda Diaria', // Título de la app
      debugShowCheckedModeBanner: false, // Quita la etiqueta de debug
      theme: theme, // Aplicamos el tema que hemos definido
      routerConfig: appRouter, // Aquí usamos el GoRouter para manejar las pantallas
    );
  }
}
