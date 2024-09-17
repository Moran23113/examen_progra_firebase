import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen_progra_firebase/pages/ticketprovider.dart';
import 'package:go_router/go_router.dart';

class DeleteConfirmationScreen extends StatelessWidget {
  final String id;

  const DeleteConfirmationScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TicketProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Confirmar Eliminación')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¿Estás seguro de que deseas eliminar este ticket?'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await provider.deleteTicket(id);
                GoRouter.of(context).go('/');
              },
              child: const Text('Eliminar'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/');
              },
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}
