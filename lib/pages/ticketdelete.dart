
// ignore_for_file: use_build_context_synchronously

import 'package:examen_progra_firebase/pages/ticketprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteConfirmationScreen extends StatelessWidget {
  final String id;

  DeleteConfirmationScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TicketProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Confirmación de Eliminación')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('¿Estás seguro de que deseas eliminar este ticket?'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await provider.deleteTicket(id);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Eliminar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
