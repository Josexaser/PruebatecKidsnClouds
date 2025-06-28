// Importamos la librería go_router, que sirve para manejar la navegación entre pantallas
import 'package:go_router/go_router.dart';
import '../screens_export.dart';

// Aquí creamos una variable llamada appRouter que guarda todas las rutas de la app
// Esto no es obligatorio en Flutter (podrías usar Navigator normal), pero go_router
// es una forma moderna y limpia de organizar las pantallas de una app

final GoRouter appRouter = GoRouter(
  routes: [
    // Ruta para la pantalla de bienvenida
    GoRoute(
      path: '/', // Este es el path inicial de la app (la raíz)
      name: WelcomeScreen.name, // Nombre de la ruta, útil si quieres navegar por nombre
      builder: (context, state) => const WelcomeScreen(), // Qué widget muestra esta ruta
    ),
    // Ruta para la pantalla principal de la agenda
    GoRoute(
      path: '/agenda_screen', // Esto es lo que usarás para navegar a esta pantalla
      name: AgendaScreen.name, // Nombre de la ruta
      builder: (context, state) => const AgendaScreen(), // Qué widget muestra esta ruta
    ),
  ],
);
