// ticket_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen_progra_firebase/pages/ticketprovider.dart';
import 'package:go_router/go_router.dart';

class TicketDetailScreen extends StatelessWidget {
  final String id;

  const TicketDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TicketProvider>(context);
    final ticket = provider.tickets.firstWhere((t) => t.id == id);

    return Scaffold(
      appBar: AppBar(title: const Text('Información de Ticket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Número de vuelo: ${ticket.numeroVuelo}'),
            Text('Aerolínea: ${ticket.aerolinea}'),
            Text('Pasajero: ${ticket.pasajero}'),
            Text('Origen: ${ticket.origen}'),
            Text('Destino: ${ticket.destino}'),
            Text('Asiento: ${ticket.asiento}'),
            Text('Clase: ${ticket.clase}'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/edit/${ticket.id}');
                  },
                  child: const Text('Editar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/delete/${ticket.id}');
                  },
                  child: const Text('Eliminar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
