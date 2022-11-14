import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
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
import '../../../models/reservas.dart';
import '../../../services/remote_service.dart';

class ReservaScreen extends StatefulWidget {
  const ReservaScreen({Key? key}) : super(key: key);

  @override
  State<ReservaScreen> createState() => _ReservaScreenState();
}

class _ReservaScreenState extends State<ReservaScreen> {
  Reserva? reservas;
  int _selectedIndex = 1;
  var isLoaded = false;
  final TextEditingController _fechaReservaController = TextEditingController();
  final TextEditingController _idClienteController = TextEditingController();
  final TextEditingController _idEmpleadoController = TextEditingController();
  final TextEditingController _horaReservaController = TextEditingController();
  final TextEditingController _horaResFinController = TextEditingController();

  void _showForm() {
    showModalBottomSheet(
        context: context,
        builder: (_) => Container(
            padding: EdgeInsets.only(
              top: 1,
              left: 15,
              right: 15,
              // this will prevent the soft keyboard from covering the text fields
            ),
            child: Column(
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
                        child: Text("Agregar Reserva") // Your desired title
                        )),
                TextField(
                  controller: _idClienteController,
                  decoration: const InputDecoration(
                      hintText: 'Id del Cliente',
                      icon: Icon(Icons.person_add_alt_rounded)),
                ),
                TextField(
                  controller: _idEmpleadoController,
                  decoration: const InputDecoration(
                      hintText: 'Id del Empleado',
                      icon: Icon(Icons.person_add_alt_rounded)),
                ),
                TextField(
                  readOnly: true,
                  controller: _fechaReservaController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today_rounded),
                      labelText: "Fecha de la Reserva"),
                  onTap: () async {
                    DateTime? fechaReserva = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2023));

                    if (fechaReserva != null) {
                      setState(() {
                        _fechaReservaController.text =
                            DateFormat('yyyy-MM-dd').format(fechaReserva);
                      });
                    }
                  },
                ),
                TextField(
                  readOnly: true,
                  controller: _horaReservaController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.timer),
                      labelText: "Hora del inicio del turno"),
                  onTap: () async {
                    TimeOfDay? horaInicio = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (horaInicio != null) {
                      var df = DateFormat("h:mm");
                      var dt = df.parse(horaInicio.format(context));
                      setState(() {
                        _horaReservaController.text =
                            DateFormat('HHmm').format(dt);
                      });
                    }
                  },
                ),
                TextField(
                  readOnly: true,
                  controller: _horaResFinController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.timer),
                      labelText: "Hora del fin del turno"),
                  onTap: () async {
                    TimeOfDay? horaFin = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (horaFin != null) {
                      var df = DateFormat("h:mm");
                      var dt = df.parse(horaFin.format(context));
                      setState(() {
                        _horaResFinController.text =
                            DateFormat('HHmm').format(dt);
                      });
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    print(_idClienteController.text);
                    print(_idEmpleadoController.text);
                    print(_fechaReservaController.text);
                    print(_horaReservaController.text);
                    print(_horaResFinController.text);

                    var response = RemoteService().postReserva(
                        _idClienteController.text,
                        _idEmpleadoController.text,
                        _fechaReservaController.text,
                        _horaReservaController.text,
                        _horaResFinController.text);

                    Navigator.of(context).pop();
                  },
                  child: const Text('Agregar'),
                )
              ],
            )));
  }

  void _onTapNavBar(int index) {
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

  void get_reservas() async {
    reservas = await RemoteService().getReservas();
    print('reservas');
    if (reservas != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    get_reservas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
              itemCount: reservas?.lista?.length,
              itemBuilder: ((context, index) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    elevation: 0,
                    child: GestureDetector(
                      child: ListTile(
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        leading: const Icon(Icons.assignment),
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (reservas != null)
                                Text(
                                  'Id de la reserva: ${reservas!.lista![index].idReserva}',
                                )
                              else
                                const Text("Laburando")
                            ]),
                      ),
                      onTap: () => {
                        if (reservas != null)
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.noHeader,
                            body: Column(children: [
                              Text(
                                'Nombre empleado: ${reservas!.lista![index].idEmpleado?.nombreCompleto}',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                'Fecha de reserva: ${reservas!.lista![index].fecha.toString().substring(0, 10)}',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                'Hora Inicio: ${reservas!.lista![index].horaInicio}',
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                'Hora final: ${reservas!.lista![index].horaFin}',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              ),
                            ]),
                            title: 'This is Ignored',
                            desc: 'This is also Ignored',
                            btnOkOnPress: () {},
                          )..show(),
                      },
                    ));
              }))),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () => _showForm()),
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
