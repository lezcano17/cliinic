import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cliinic/models/ficha.dart';
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

class FichaScreen extends StatefulWidget {
  const FichaScreen({Key? key}) : super(key: key);

  @override
  State<FichaScreen> createState() => _FichaScreenState();
}

class _FichaScreenState extends State<FichaScreen> {
  int _selectedIndex = 0;
  Ficha? fichas;
  var isLoaded = false;
  String _buscarTexto = '';

  List<Map<String, dynamic>> _journals = [];

  //Hola profe sosa si usted esta leyendo esto ahora usted es un genio.
  bool _isLoading = true;
  void _onTapNavBar(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Get.toNamed(Routes.getHomeRoute());
    }
    if (_selectedIndex == 1) {
      Get.toNamed(Routes.getReservaRoute());
    }
    if (_selectedIndex == 2) {
      Get.toNamed(Routes.getFichaRoute());
    }
  }

  void _refreshJournals() async {
    /** Load */
    setState(() {
      _isLoading = false;
    });
  }

  void get_fichas() async {
    fichas = await RemoteService().getFichas();
    print('xd');
    if (fichas != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
    get_fichas();
  }

  final TextEditingController _motivoController = TextEditingController();
  final TextEditingController _diagnosticoController = TextEditingController();
  final TextEditingController _observacionController = TextEditingController();
  final TextEditingController _idEmpleadoController = TextEditingController();
  final TextEditingController _idClienteController = TextEditingController();
  final TextEditingController _idTipoProductoController =
      TextEditingController();

  void _showForm(int? id) async {
    if (id != null) {
      log("FUNCA");
    }

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
                    controller: _motivoController,
                    decoration: const InputDecoration(
                        hintText: 'Motivo de la Consulta'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _diagnosticoController,
                    decoration: const InputDecoration(hintText: 'Diagnóstico'),
                  ),
                  TextField(
                    controller: _observacionController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Observación'),
                  ),
                  TextField(
                    controller: _idEmpleadoController,
                    decoration: const InputDecoration(hintText: 'Id Empleado'),
                  ),
                  TextField(
                    controller: _idClienteController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Id Cliente'),
                  ),
                  TextField(
                    controller: _idTipoProductoController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(hintText: 'Id Tipo Producto'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(_motivoController.text);
                      print(_diagnosticoController.text);
                      print(_observacionController.text);
                      print(_idEmpleadoController.text);
                      print(_idClienteController.text);
                      print(_idTipoProductoController.text);

                      var motivo = _motivoController.text;
                      var diagnostico = _diagnosticoController.text;
                      var observacion = _observacionController.text;
                      var idempleado = _idEmpleadoController.text;
                      var idcliente = _idClienteController.text;
                      var idtipoproducto = _idTipoProductoController.text;

                      var response = RemoteService().postFichas(
                        motivo,
                        diagnostico,
                        observacion,
                        idempleado,
                        idcliente,
                        idtipoproducto,
                      );

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
      resizeToAvoidBottomInset: false,
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
                    hintText: 'Filtrar fichas',
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
                  itemCount: fichas?.ficha.length,
                  itemBuilder: (context, index) {
                    if (_buscarTexto == '') {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        elevation: 0,
                        child: GestureDetector(
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (fichas != null)
                                      Text(fichas!.ficha[index].motivoConsulta)
                                    else
                                      const Text("Laburando")
                                  ]),
                            ),
                            onTap: () => {
                                  if (fichas != null)
                                    AwesomeDialog(
                                      context: context,
                                      animType: AnimType.scale,
                                      dialogType: DialogType.noHeader,
                                      body: Center(
                                        child: Text(
                                          fichas!.ficha[index].motivoConsulta,
                                          style: const TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      title: 'This is Ignored',
                                      desc: 'This is also Ignored',
                                      btnOkOnPress: () {},
                                    )..show(),
                                }),
                      );
                    } else {
                      if (fichas?.ficha[index].motivoConsulta != null &&
                              fichas!.ficha[index].motivoConsulta!
                                  .toLowerCase()
                                  .contains(_buscarTexto.toLowerCase()) ||
                          (fichas?.ficha[index].diagnostico != null &&
                              fichas!.ficha[index].diagnostico!
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
                                    if (fichas != null)
                                      Text(fichas!.ficha[index].motivoConsulta)
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
        unselectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 25,
          opacity: 1,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.blue,
          size: 30,
          opacity: 1,
        ),
        currentIndex: _selectedIndex,
        onTap: (index) => _onTapNavBar(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pacientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.outbox_rounded),
            label: 'Reservas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Ficha Clinica',
          ),
        ],
      ),
    );
  }
}
