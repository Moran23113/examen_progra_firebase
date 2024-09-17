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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Información de Ticket',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.white,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Número de vuelo: ${ticket.numeroVuelo}',
                          style: const TextStyle(fontSize: 18)),
                      Text('Aerolínea: ${ticket.aerolinea}',
                          style: const TextStyle(fontSize: 18)),
                      Text('Pasajero: ${ticket.pasajero}',
                          style: const TextStyle(fontSize: 18)),
                      Text('Origen: ${ticket.origen}',
                          style: const TextStyle(fontSize: 18)),
                      Text('Destino: ${ticket.destino}',
                          style: const TextStyle(fontSize: 18)),
                      Text('Asiento: ${ticket.asiento}',
                          style: const TextStyle(fontSize: 18)),
                      Text('Clase: ${ticket.clase}',
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
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
      ),
    );
  }
}
