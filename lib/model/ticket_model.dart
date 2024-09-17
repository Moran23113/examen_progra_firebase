import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  final String id;
  final String numeroVuelo;
  final String aerolinea;
  final String pasajero;
  final String origen;
  final String destino;
  final String asiento;
  final String clase;

  Ticket({
    required this.id,
    required this.numeroVuelo,
    required this.aerolinea,
    required this.pasajero,
    required this.origen,
    required this.destino,
    required this.asiento,
    required this.clase,
  });

  Map<String, dynamic> toMap() {
    return {
      'numeroVuelo': numeroVuelo,
      'aerolinea': aerolinea,
      'pasajero': pasajero,
      'origen': origen,
      'destino': destino,
      'asiento': asiento,
      'clase': clase,
    };
  }

  factory Ticket.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Ticket(
      id: doc.id,
      numeroVuelo: data['numeroVuelo'] ?? '',
      aerolinea: data['aerolinea'] ?? '',
      pasajero: data['pasajero'] ?? '',
      origen: data['origen'] ?? '',
      destino: data['destino'] ?? '',
      asiento: data['asiento'] ?? '',
      clase: data['clase'] ?? '',
    );
  }

  Ticket copyWith({
    String? id,
    String? numeroVuelo,
    String? aerolinea,
    String? pasajero,
    String? origen,
    String? destino,
    String? asiento,
    String? clase,
  }) {
    return Ticket(
      id: id ?? this.id,
      numeroVuelo: numeroVuelo ?? this.numeroVuelo,
      aerolinea: aerolinea ?? this.aerolinea,
      pasajero: pasajero ?? this.pasajero,
      origen: origen ?? this.origen,
      destino: destino ?? this.destino,
      asiento: asiento ?? this.asiento,
      clase: clase ?? this.clase,
    );
  }
}
