enum EventCategory {
  alimentacion,
  siesta,
  actividad,
  deposicion,
  observacion,
}

extension EventCategoryExtension on EventCategory {
  String get displayName {
    switch (this) {
      case EventCategory.alimentacion:
        return 'Alimentación';
      case EventCategory.siesta:
        return 'Siesta';
      case EventCategory.actividad:
        return 'Actividad';
      case EventCategory.deposicion:
        return 'Deposición';
      case EventCategory.observacion:
        return 'Observación';
    }
  }
}

class Event {
  final String id;
  final String childId;
  final DateTime time;
  final String description;
  final EventCategory category;

  Event({
    required this.id,
    required this.childId,
    required this.time,
    required this.description,
    required this.category,
  });
}
