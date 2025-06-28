import 'package:flutter/material.dart';

// Este archivo sirve para configurar los colores y el tema general de la app

// Aquí creamos una lista con un montón de colores distintos
// Estos colores se pueden usar para personalizar cómo se ve la app
const colorList = <Color>[
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.lime,
  Colors.indigo,
  Colors.amber,
  Colors.brown,
  Colors.deepPurple,
  Colors.deepOrange,
  Colors.lightBlue,
  Colors.lightGreen,  
];


// Esta clase se llama AppTheme y nos sirve para:
// - Guardar qué color de la lista está seleccionado
// - Generar el tema de la app (ThemeData) usando ese color

class AppTheme {
  // Aquí guardamos qué color está elegido de la lista
  final int selectedColorIndex;

  // Constructor: cuando creamos un AppTheme podemos decirle qué color usar
  
  const AppTheme({
    this.selectedColorIndex = 0
  });

  // Este método devuelve el tema completo de la app (ThemeData)
  // Flutter usa esto para cambiar colores, fuentes, etc
  ThemeData themeData() => ThemeData(
    useMaterial3: true, // Esto activa Material 3 que es una versión más moderna de los diseños de Flutter
    colorSchemeSeed: colorList[selectedColorIndex], // Aquí metemos el color que se elige de la lista
    brightness: Brightness.light, 
  );
}
