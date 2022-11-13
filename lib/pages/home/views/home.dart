import 'dart:developer';

import 'package:cliinic/pages/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

import '../../../config/routes.dart';
import '../../../models/lista.dart';
import '../../../services/remote_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  Post? personas;
  var isLoaded = false;
  String _buscarTexto = '';

  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  void _onTapNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _refreshJournals() async {
    /** Load */
    setState(() {
      _isLoading = false;
    });
  }

  void get_personas() async {
    personas = await RemoteService().getPersonas();
    print('xd');
    if (personas != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
    get_personas();
  }

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _rucController = TextEditingController();
  final TextEditingController _tipoPersonaController = TextEditingController();
  final TextEditingController _fechaNacController = TextEditingController();

  void _showForm(int? id) async {
    if (id != null) {
      log("FUNCA");
    }

    final Map<String, String> datosPaciente = {
      'nombre': '',
      'apellido': '',
      'email': '',
      'telefono': '',
      'ruc': '',
      'cedula': '',
      'tipoPersona': '',
      'fechaNacimiento': '',
    };

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                      leading: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                                Icons.arrow_back) // the arrow back icon
                            ),
                      ),
                      title: const Center(
                          child: Text("Agregar Persona") // Your desired title
                          )),
                  TextField(
                    controller: _nombreController,
                    decoration: const InputDecoration(hintText: 'Nombre'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _apellidoController,
                    decoration: const InputDecoration(hintText: 'Apellido'),
                  ),
                  TextField(
                    controller: _telefonoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Teléfono'),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  TextField(
                    controller: _cedulaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Cedula'),
                  ),
                  TextField(
                    controller: _rucController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Ruc'),
                  ),
                  TextField(
                    controller: _tipoPersonaController,
                    decoration:
                        const InputDecoration(hintText: 'Tipo de Persona'),
                  ),
                  TextField(
                    readOnly: true,
                    controller: _fechaNacController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today_rounded),
                        labelText: "Fecha de Nacimiento"),
                    onTap: () async {
                      DateTime? fechaNac = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2023));

                      if (fechaNac != null) {
                        setState(() {
                          _fechaNacController.text =
                              DateFormat('yyyy-MM-dd').format(fechaNac);
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(_nombreController.text);
                      print(_apellidoController.text);
                      print(_telefonoController.text);
                      print(_emailController.text);
                      print(_cedulaController.text);
                      print(_rucController.text);
                      print(_fechaNacController.text);
                      print(_tipoPersonaController.text);

                      var nombre = _nombreController.text;
                      var apellido = _apellidoController.text;
                      var email = _emailController.text;
                      var telefono = _telefonoController.text;
                      var ruc = _rucController.text;
                      var cedula = _cedulaController.text;
                      var tipoPersona = _tipoPersonaController.text;
                      var FechaNacimiento =
                          _fechaNacController.text + ' 00:00:00';

                      print(FechaNacimiento);

                      var response = RemoteService().postPersonas(
                          nombre,
                          apellido,
                          email,
                          telefono,
                          ruc,
                          cedula,
                          tipoPersona,
                          FechaNacimiento);

                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }

  // Insert a new journal to the database
  Future<void> _addItem() async {
    /*Create*/
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    /*update*/
  }

  // Delete an item
  void _deleteItem(int id) async {
    /*DELETE*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Filtrar pacientes',
                    prefixIcon: Icon(Icons.person_search),
                  ),
                  onChanged: ((value) => {
                        setState(
                          (() => {_buscarTexto = value}),
                        )
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: personas?.lista.length,
                  itemBuilder: (context, index) {
                    if (_buscarTexto == '') {
                      return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          elevation: 0,
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (personas != null)
                                    Text(personas!.lista[index].nombreCompleto)
                                  else
                                    const Text("Laburando")
                                ]),
                          ));
                    } else {
                      if (personas?.lista[index].nombre != null &&
                              personas!.lista[index].nombre!
                                  .toLowerCase()
                                  .contains(_buscarTexto.toLowerCase()) ||
                          (personas?.lista[index].apellido != null &&
                              personas!.lista[index].apellido!
                                  .toLowerCase()
                                  .contains(_buscarTexto.toLowerCase()))) {
                        return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            margin:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            elevation: 0,
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (personas != null)
                                      Text(
                                          personas!.lista[index].nombreCompleto)
                                    else
                                      const Text("NULL")
                                  ]),
                            ));
                      } else {
                        return Container();
                      }
                    }
                    // personas!.lista[index].nombreCompleto);
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () => _showForm(0)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 25,
          opacity: 1,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
          size: 30,
          opacity: 1,
        ),
        currentIndex: _selectedIndex,
        onTap: (index) => _onTapNavBar(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_outlined),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.outbox_rounded),
            label: 'Prueba',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuario',
          ),
        ],
      ),
    );
  }
}
