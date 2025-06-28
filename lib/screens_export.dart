// Archivo de barril que contiene las pantallas, widgets, modelos y datos de la aplicación
// Esto sirve para que en lugar de importar uno por uno cada archivo en otras partes del proyecto,
// podamos importar solo este archivo y tener acceso a todo.
// Es una forma de mantener el proyecto más ordenado y limpio, sobre todo cuando crece mucho.

// screens
export 'package:agenda_diaria/screens/welcome_screen.dart';
export 'package:agenda_diaria/screens/agenda_screen.dart';

// widgets
export 'package:agenda_diaria/widgets/header.dart';
export 'package:agenda_diaria/widgets/category_selector.dart';
export 'package:agenda_diaria/widgets/event_list.dart';
export 'package:agenda_diaria/widgets/event_card.dart';
export 'package:agenda_diaria/widgets/chat_modal.dart';

// models
export 'package:agenda_diaria/models/child.dart';
export 'package:agenda_diaria/models/event.dart';

// data
export 'package:agenda_diaria/data/mock_data.dart';
