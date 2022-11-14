import 'dart:convert';

import 'package:cliinic/models/ficha.dart';
import 'package:cliinic/models/lista.dart';
import 'package:http/http.dart' as http;

import '../models/reservas.dart';

class RemoteService {
  Future<Post?> getPersonas() async {
    var client = http.Client();

    var uri = Uri.parse('https://equipoyosh.com/stock-nutrinatalia/persona');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var datos = response.body;
      return postFromJson(datos);
    }
  }

  Future<Ficha?> getFichas() async {
    var client = http.Client();

    var uri =
        Uri.parse('https://equipoyosh.com/stock-nutrinatalia/fichaClinica');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var datos = response.body;
      return fichaFromJson(datos);
    }
  }

  Future<String> postFichas(
    String motivo,
    String diagnostico,
    String observacion,
    String idempleado,
    String idcliente,
    String idtipoproducto,
  ) async {
    var client = http.Client();

    var uri =
        Uri.parse('https://equipoyosh.com/stock-nutrinatalia/fichaClinica');
    var response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'motivoConsulta': motivo,
        'diagnostico': diagnostico,
        'observacion': observacion,
        'idEmpleado': idempleado,
        'idCliente': idcliente,
        'idTipoProducto': idtipoproducto,
      }),
    );

    print('xd');

    print(response.statusCode);

    if (response.statusCode == 201 || response.statusCode == 301) {
      print('agregado');
      return 'AGREGADO';
    } else {
      print('error');
      return 'ERROR';
    }
  }

  Future<String> postPersonas(
      String nombre,
      String apellido,
      String email,
      String telefono,
      String ruc,
      String cedula,
      String tipoPersona,
      String fechaNacimiento) async {
    var client = http.Client();

    var uri = Uri.parse('https://equipoyosh.com/stock-nutrinatalia/persona');
    var response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombre': nombre,
        'apellido': apellido,
        'email': email,
        'telefono': telefono,
        'ruc': ruc,
        'cedula': cedula,
        'tipoPersona': tipoPersona,
        'fechaNacimiento': fechaNacimiento
      }),
    );

    print('xd');

    print(response.statusCode);

    if (response.statusCode == 201 || response.statusCode == 301) {
      print('agregado');
      return 'AGREGADO';
    } else {
      print('error');
      return 'ERROR';
    }
  }

  Future<String> deletePersona(int id) async {
    var uri =
        Uri.parse('https://equipoyosh.com/stock-nutrinatalia/persona/$id');
    var response = await http.delete(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      print('se elimino, tranquilo');
      return 'eliminado';
    } else {
      print('error eliminando');
      throw Exception('error eliminando');
    }
  }

  Future<Reserva?> getReservas() async {
    var uri = Uri.parse('https://equipoyosh.com/stock-nutrinatalia/reserva');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var datos = response.body;
      return reservaFromJson(datos);
    }
  }

  Future<String> postReserva(
    String idCliente,
    String idEmpleado,
    String fechaReserva,
    String horaInicio,
    String horaFin,
  ) async {
    var uri = Uri.parse('https://equipoyosh.com/stock-nutrinatalia/reserva');
    var response = await http.post(
      uri,
      headers: <String, String>{
        'usuario': 'usuario1',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'idEmpleado': {'idPersona': idEmpleado},
        'idCliente': {'idPersona': idCliente},
        'fechaCadena': fechaReserva,
        'horaInicioCadena': horaInicio,
        'horaFinCadena': horaFin
      }),
    );

    print('xd');

    print(response.statusCode);

    if (response.statusCode == 201 ||
        response.statusCode == 301 ||
        response.statusCode == 200) {
      print('agregado');
      return 'AGREGADO';
    } else {
      print('error');
      return 'ERROR';
    }
  }
}
