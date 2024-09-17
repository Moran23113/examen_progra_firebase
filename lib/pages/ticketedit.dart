import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen_progra_firebase/model/ticket_model.dart';
import 'package:examen_progra_firebase/pages/ticketprovider.dart';

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  isNew ? 'Agregar Ticket' : 'Editar Ticket',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField(
                          controller: _numeroVueloController,
                          label: 'Número de vuelo',
                        ),
                        _buildTextField(
                          controller: _aerolineaController,
                          label: 'Aerolínea',
                        ),
                        _buildTextField(
                          controller: _pasajeroController,
                          label: 'Pasajero',
                        ),
                        _buildTextField(
                          controller: _origenController,
                          label: 'Origen',
                        ),
                        _buildTextField(
                          controller: _destinoController,
                          label: 'Destino',
                        ),
                        _buildTextField(
                          controller: _asientoController,
                          label: 'Asiento',
                        ),
                        _buildTextField(
                          controller: _claseController,
                          label: 'Clase',
                        ),
                        const SizedBox(height: 20),
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
                          child: Text(isNew ? 'Agregar' : 'Guardar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
