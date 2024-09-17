import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/ticket_model.dart';

class TicketProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;

  TicketProvider() {
    _fetchTickets();
  }

  Future<void> _fetchTickets() async {
    try {
      final snapshot = await _firestore.collection('tickets').get();
      _tickets = snapshot.docs
          .map((doc) => Ticket.fromDocument(doc))
          .toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching tickets: $e');
    }
  }

  Future<void> addTicket(Ticket ticket) async {
    try {
      final docRef = await _firestore.collection('tickets').add(ticket.toMap());
      final newTicket = ticket.copyWith(id: docRef.id);
      _tickets.add(newTicket);
      notifyListeners();
    } catch (e) {
      print('Error adding ticket: $e');
    }
  }

  Future<void> updateTicket(Ticket ticket) async {
    try {
      await _firestore
          .collection('tickets')
          .doc(ticket.id)
          .update(ticket.toMap());
      final index = _tickets.indexWhere((t) => t.id == ticket.id);
      if (index != -1) {
        _tickets[index] = ticket;
        notifyListeners();
      }
    } catch (e) {
      print('Error updating ticket: $e');
    }
  }

  Future<void> deleteTicket(String id) async {
    try {
      await _firestore.collection('tickets').doc(id).delete();
      _tickets.removeWhere((t) => t.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting ticket: $e');
    }
  }
}
