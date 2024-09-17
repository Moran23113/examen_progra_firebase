
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_progra_firebase/model/ticket_model.dart';


Future<void> agregarTicket(Ticket ticket) async {
  await FirebaseFirestore.instance.collection('TicketAvion').add(ticket.toMap());
}


Stream<List<Ticket>> leerTickets() {
  return FirebaseFirestore.instance
      .collection('TicketAvion')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Ticket.fromDocument(doc))
          .toList());
}

Future<void> actualizarTicket(Ticket ticket) async {
  await FirebaseFirestore.instance
      .collection('TicketAvion')
      .doc(ticket.id)
      .update(ticket.toMap());
}


Future<void> eliminarTicket(String id) async {
  await FirebaseFirestore.instance.collection('TicketAvion').doc(id).delete();
}
*/