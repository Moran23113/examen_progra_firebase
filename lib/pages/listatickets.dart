
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:examen_progra_firebase/pages/ticketprovider.dart';

class TicketListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TicketProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Tickets')),
      body: Consumer<TicketProvider>(
        builder: (context, provider, child) {
          if (provider.tickets.isEmpty) {
            return const Center(child: Text('Sin tickets disponibles'));
          }
          return ListView.builder(
            itemCount: provider.tickets.length,
            itemBuilder: (context, index) {
              final ticket = provider.tickets[index];
              return ListTile(
                title: Text(ticket.numeroVuelo),
                subtitle: Text('Aerolínea: ${ticket.aerolinea}'),
                onTap: () {
                  GoRouter.of(context).go('/detail/${ticket.id}');
                },
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    GoRouter.of(context).go('/edit/${ticket.id}');
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go('/edit/new');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
