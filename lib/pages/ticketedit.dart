import 'package:examen_progra_firebase/model/ticket_model.dart';
import 'package:examen_progra_firebase/pages/ticketprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketEditScreen extends StatefulWidget {
  final String id;

  const TicketEditScreen({super.key, required this.id});

  @override
  _TicketEditScreenState createState() => _TicketEditScreenState();
}

class _TicketEditScreenState extends State<TicketEditScreen> {
  late TextEditingController _numeroVueloController;
  late TextEditingController _aerolineaController;
  late TextEditingController _pasajeroController;
  late TextEditingController _origenController;
  late TextEditingController _destinoController;
  late TextEditingController _asientoController;
  late TextEditingController _claseController;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TicketProvider>(context, listen: false);
    final ticket = widget.id == 'new'
        ? Ticket(
            id: '',
            numeroVuelo: '',
            aerolinea: '',
            pasajero: '',
            origen: '',
            destino: '',
            asiento: '',
            clase: '',
          )
        : provider.tickets.firstWhere((t) => t.id == widget.id);

    _numeroVueloController = TextEditingController(text: ticket.numeroVuelo);
    _aerolineaController = TextEditingController(text: ticket.aerolinea);
    _pasajeroController = TextEditingController(text: ticket.pasajero);
    _origenController = TextEditingController(text: ticket.origen);
    _destinoController = TextEditingController(text: ticket.destino);
    _asientoController = TextEditingController(text: ticket.asiento);
    _claseController = TextEditingController(text: ticket.clase);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TicketProvider>(context);
    final isNew = widget.id == 'new';

    return Scaffold(
      appBar: AppBar(title: Text(isNew ? 'Add Ticket' : 'Edit Ticket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _numeroVueloController,
              decoration: const InputDecoration(labelText: 'Número de vuelo'),
            ),
            TextFormField(
              controller: _aerolineaController,
              decoration: const InputDecoration(labelText: 'Aerolínea'),
            ),
            TextFormField(
              controller: _pasajeroController,
              decoration: const InputDecoration(labelText: 'Pasajero'),
            ),
            TextFormField(
              controller: _origenController,
              decoration: const InputDecoration(labelText: 'Origen'),
            ),
            TextFormField(
              controller: _destinoController,
              decoration: const InputDecoration(labelText: 'Destino'),
            ),
            TextFormField(
              controller: _asientoController,
              decoration: const InputDecoration(labelText: 'Asiento'),
            ),
            TextFormField(
              controller: _claseController,
              decoration: const InputDecoration(labelText: 'Clase'),
            ),
            ElevatedButton(
              onPressed: () async {
                final updatedTicket = Ticket(
                  id: isNew ? '' : widget.id,
                  numeroVuelo: _numeroVueloController.text,
                  aerolinea: _aerolineaController.text,
                  pasajero: _pasajeroController.text,
                  origen: _origenController.text,
                  destino: _destinoController.text,
                  asiento: _asientoController.text,
                  clase: _claseController.text,
                );

                if (isNew) {
                  await provider.addTicket(updatedTicket);
                } else {
                  await provider.updateTicket(updatedTicket);
                }
                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
