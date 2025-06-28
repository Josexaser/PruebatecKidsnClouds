// Aquí importamos las clases de niño (Child) y de evento (Event)
import '../models/child.dart';
import '../models/event.dart';

// Esta es una lista de niños de prueba, como si fuera nuestra "base de datos" de ejemplo
final List<Child> mockChildren = [
  Child(
    id: '1',
    name: 'Jim Halpert',
    imageUrl: 'https://corsproxy.io/?https://randomuser.me/api/portraits/lego/1.jpg',
  ),
  Child(
    id: '2',
    name: 'Pamela Beesly',
    imageUrl: 'https://corsproxy.io/?https://randomuser.me/api/portraits/lego/2.jpg',
  ),
  Child(
    id: '3',
    name: 'Dwight Schrute',
    imageUrl: 'https://corsproxy.io/?https://randomuser.me/api/portraits/lego/3.jpg',
  ),
  Child(
    id: '4',
    name: 'Andy Bernard',
    imageUrl: 'https://corsproxy.io/?https://randomuser.me/api/portraits/lego/4.jpg',
  ),
];

// Aquí hacemos otra lista, pero de eventos. Cada evento está relacionado con un niño por su id
final List<Event> mockEvents = [
  Event(
    id: 'e1',
    childId: '1', // Esto dice que este evento es de Jim
    time: DateTime.now().subtract(const Duration(hours: 2)), // Hace 2 horas
    description: 'Desayunó cereales con leche.',
    category: EventCategory.alimentacion,
  ),
  Event(
    id: 'e2',
    childId: '2', // Pamela
    time: DateTime.now().subtract(const Duration(hours: 1)), // Hace 1 hora
    description: 'Durmió 45 minutos.',
    category: EventCategory.siesta,
  ),
  Event(
    id: 'e3',
    childId: '3', // Dwight
    time: DateTime.now().subtract(const Duration(minutes: 45)), // Hace 45 mins
    description: 'Jugó con bloques de construcción.',
    category: EventCategory.actividad,
  ),
  Event(
    id: 'e4',
    childId: '4', // Andy
    time: DateTime.now().subtract(const Duration(minutes: 30)),
    description: 'Hizo caquita en el orinal.',
    category: EventCategory.deposicion,
  ),
  Event(
    id: 'e5',
    childId: '2', // Pamela otra vez
    time: DateTime.now().subtract(const Duration(minutes: 10)),
    description: 'Estuvo un poco inquieta, pero luego se calmó.',
    category: EventCategory.observacion,
  ),
];
