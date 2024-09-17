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

 



}
