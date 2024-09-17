// ticket_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  String id;
  String numeroVuelo;
  String aerolinea;
  String pasajero;
  String origen;
  String destino;
  String asiento;
  String clase;

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

  // Convertir de Firebase snapshot a objeto Ticket
  factory Ticket.fromDocument(DocumentSnapshot doc) {
    return Ticket(
      id: doc.id,
      numeroVuelo: doc['numeroVuelo'],
      aerolinea: doc['aerolinea'],
      pasajero: doc['pasajero'],
      origen: doc['origen'],
      destino: doc['destino'],
      asiento: doc['asiento'],
      clase: doc['clase'],
    );
  }



}
