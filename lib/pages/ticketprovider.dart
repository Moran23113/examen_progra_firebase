import 'package:flutter/material.dart';
import 'package:examen_progra_firebase/crud/ticket_opciones_crud.dart';
import 'package:examen_progra_firebase/model/ticket_model.dart';

class TicketProvider with ChangeNotifier {
  List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;

  TicketProvider() {
    fetchTickets();
  }

  Future<void> fetchTickets() async {
    leerTickets().listen((ticketList) {
      _tickets = ticketList;
      notifyListeners();
    });
  }

  Future<void> addTicket(Ticket ticket) async {
    await agregarTicket(ticket);
    await fetchTickets();
  }

  Future<void> updateTicket(Ticket ticket) async {
    await actualizarTicket(ticket);
    await fetchTickets();
  }

  Future<void> deleteTicket(String id) async {
    await eliminarTicket(id);
    await fetchTickets();
  }
}
