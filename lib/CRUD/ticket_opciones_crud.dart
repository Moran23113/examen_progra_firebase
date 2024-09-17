// ticket_crud.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_progra_firebase/model/ticket_model.dart';

// Agregar Ticket (Crear)
Future<void> agregarTicket(Ticket ticket) async {
  await FirebaseFirestore.instance.collection('TicketAvion').add(ticket.toMap());
}

// Leer Tickets (Listar)
Stream<List<Ticket>> leerTickets() {
  return FirebaseFirestore.instance
      .collection('TicketAvion')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Ticket.fromDocument(doc))
          .toList());
}

// Actualizar Ticket
Future<void> actualizarTicket(Ticket ticket) async {
  await FirebaseFirestore.instance
      .collection('TicketAvion')
      .doc(ticket.id)
      .update(ticket.toMap());
}

// Eliminar Ticket
Future<void> eliminarTicket(String id) async {
  await FirebaseFirestore.instance.collection('TicketAvion').doc(id).delete();
}
