// To parse this JSON data, do
//
//     final reserva = reservaFromJson(jsonString);

import 'dart:convert';

Reserva reservaFromJson(String str) => Reserva.fromJson(json.decode(str));

String reservaToJson(Reserva data) => json.encode(data.toJson());

class Reserva {
  Reserva({
    required this.lista,
    required this.totalDatos,
  });

  final List<Lista>? lista;
  final int totalDatos;

  factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
        lista: json["lista"] == null
            ? null
            : List<Lista>.from(json["lista"].map((x) => Lista.fromJson(x))),
        totalDatos: json["totalDatos"],
      );

  Map<String, dynamic> toJson() => {
        "lista": lista == null
            ? null
            : List<dynamic>.from(lista!.map((x) => x.toJson())),
        "totalDatos": totalDatos,
      };
}

class Lista {
  Lista({
    required this.idReserva,
    required this.fecha,
    required this.horaInicio,
    required this.horaFin,
    required this.fechaHoraCreacion,
    required this.flagEstado,
    required this.flagAsistio,
    required this.observacion,
    this.idFichaClinica,
    required this.idLocal,
    required this.idCliente,
    required this.idEmpleado,
    required this.fechaCadena,
    this.fechaDesdeCadena,
    this.fechaHastaCadena,
    required this.horaInicioCadena,
    required this.horaFinCadena,
  });

  final int idReserva;
  final DateTime? fecha;
  final String? horaInicio;
  final String? horaFin;
  final DateTime? fechaHoraCreacion;
  final FlagEstado? flagEstado;
  final Flag? flagAsistio;
  final String? observacion;
  final dynamic idFichaClinica;
  final IdLocal? idLocal;
  final Id? idCliente;
  final Id? idEmpleado;
  final String fechaCadena;
  final dynamic fechaDesdeCadena;
  final dynamic fechaHastaCadena;
  final String horaInicioCadena;
  final String horaFinCadena;

  factory Lista.fromJson(Map<String, dynamic> json) => Lista(
        idReserva: json["idReserva"],
        fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
        horaInicio: json["horaInicio"],
        horaFin: json["horaFin"],
        fechaHoraCreacion: json["fechaHoraCreacion"] == null
            ? null
            : DateTime.parse(json["fechaHoraCreacion"]),
        flagEstado: json["flagEstado"] == null
            ? null
            : flagEstadoValues.map[json["flagEstado"]],
        flagAsistio: json["flagAsistio"] == null
            ? null
            : flagValues.map[json["flagAsistio"]],
        observacion: json["observacion"],
        idFichaClinica: json["idFichaClinica"],
        idLocal:
            json["idLocal"] == null ? null : IdLocal.fromJson(json["idLocal"]),
        idCliente:
            json["idCliente"] == null ? null : Id.fromJson(json["idCliente"]),
        idEmpleado:
            json["idEmpleado"] == null ? null : Id.fromJson(json["idEmpleado"]),
        fechaCadena: json["fechaCadena"],
        fechaDesdeCadena: json["fechaDesdeCadena"],
        fechaHastaCadena: json["fechaHastaCadena"],
        horaInicioCadena: json["horaInicioCadena"],
        horaFinCadena: json["horaFinCadena"],
      );

  Map<String, dynamic> toJson() => {
        "idReserva": idReserva,
        "fecha": fecha == null
            ? null
            : "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha?.day.toString().padLeft(2, '0')}",
        "horaInicio": horaInicio,
        "horaFin": horaFin,
        "fechaHoraCreacion": fechaHoraCreacion == null
            ? null
            : fechaHoraCreacion?.toIso8601String(),
        "flagEstado":
            flagEstado == null ? null : flagEstadoValues.reverse[flagEstado],
        "flagAsistio":
            flagAsistio == null ? null : flagValues.reverse[flagAsistio],
        "observacion": observacion,
        "idFichaClinica": idFichaClinica,
        "idLocal": idLocal == null ? null : idLocal?.toJson(),
        "idCliente": idCliente == null ? null : idCliente?.toJson(),
        "idEmpleado": idEmpleado == null ? null : idEmpleado?.toJson(),
        "fechaCadena": fechaCadena,
        "fechaDesdeCadena": fechaDesdeCadena,
        "fechaHastaCadena": fechaHastaCadena,
        "horaInicioCadena": horaInicioCadena,
        "horaFinCadena": horaFinCadena,
      };
}

enum Flag { S, N, FLAG_S }

final flagValues = EnumValues({"s": Flag.FLAG_S, "N": Flag.N, "S": Flag.S});

enum FlagEstado { R, C }

final flagEstadoValues = EnumValues({"C": FlagEstado.C, "R": FlagEstado.R});

class Id {
  Id({
    this.idPersona,
    this.nombre,
    this.apellido,
    this.email,
    this.telefono,
    this.seguroMedico,
    this.seguroMedicoNumero,
    this.ruc,
    this.cedula,
    this.tipoPersona,
    this.usuarioLogin,
    this.idLocalDefecto,
    this.flagVendedor,
    this.flagTaxfree,
    this.flagExcepcionChequeoVenta,
    this.observacion,
    this.direccion,
    this.idCiudad,
    this.tipoCliente,
    this.fechaHoraAprobContrato,
    this.soloUsuariosDelSistema,
    this.soloPersonasTaxfree,
    required this.nombreCompleto,
    required this.limiteCredito,
    this.fechaNacimiento,
    this.soloProximosCumpleanhos,
    this.todosLosCampos,
    this.incluirLimiteDeCredito,
    this.deuda,
    this.saldo,
    this.creditos,
  });

  final int? idPersona;
  final String? nombre;
  final String? apellido;
  final String? email;
  final String? telefono;
  final dynamic seguroMedico;
  final dynamic seguroMedicoNumero;
  final String? ruc;
  final String? cedula;
  final TipoPersona? tipoPersona;
  final UsuarioLogin? usuarioLogin;
  final IdLocal? idLocalDefecto;
  final Flag? flagVendedor;
  final dynamic flagTaxfree;
  final Flag? flagExcepcionChequeoVenta;
  final dynamic observacion;
  final dynamic direccion;
  final dynamic idCiudad;
  final TipoCliente? tipoCliente;
  final dynamic fechaHoraAprobContrato;
  final dynamic soloUsuariosDelSistema;
  final dynamic soloPersonasTaxfree;
  final String nombreCompleto;
  final num limiteCredito;
  final DateTime? fechaNacimiento;
  final dynamic soloProximosCumpleanhos;
  final dynamic todosLosCampos;
  final dynamic incluirLimiteDeCredito;
  final dynamic deuda;
  final dynamic saldo;
  final dynamic creditos;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        idPersona: json["idPersona"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        telefono: json["telefono"],
        seguroMedico: json["seguroMedico"],
        seguroMedicoNumero: json["seguroMedicoNumero"],
        ruc: json["ruc"],
        cedula: json["cedula"],
        tipoPersona: json["tipoPersona"] == null
            ? null
            : tipoPersonaValues.map[json["tipoPersona"]],
        usuarioLogin: json["usuarioLogin"] == null
            ? null
            : usuarioLoginValues.map[json["usuarioLogin"]],
        idLocalDefecto: json["idLocalDefecto"] == null
            ? null
            : IdLocal.fromJson(json["idLocalDefecto"]),
        flagVendedor: json["flagVendedor"] == null
            ? null
            : flagValues.map[json["flagVendedor"]],
        flagTaxfree: json["flagTaxfree"],
        flagExcepcionChequeoVenta: json["flagExcepcionChequeoVenta"] == null
            ? null
            : flagValues.map[json["flagExcepcionChequeoVenta"]],
        observacion: json["observacion"],
        direccion: json["direccion"],
        idCiudad: json["idCiudad"],
        tipoCliente: json["tipoCliente"] == null
            ? null
            : tipoClienteValues.map[json["tipoCliente"]],
        fechaHoraAprobContrato: json["fechaHoraAprobContrato"],
        soloUsuariosDelSistema: json["soloUsuariosDelSistema"],
        soloPersonasTaxfree: json["soloPersonasTaxfree"],
        nombreCompleto: json["nombreCompleto"],
        limiteCredito: json["limiteCredito"],
        fechaNacimiento: json["fechaNacimiento"] == null
            ? null
            : DateTime.parse(json["fechaNacimiento"]),
        soloProximosCumpleanhos: json["soloProximosCumpleanhos"],
        todosLosCampos: json["todosLosCampos"],
        incluirLimiteDeCredito: json["incluirLimiteDeCredito"],
        deuda: json["deuda"],
        saldo: json["saldo"],
        creditos: json["creditos"],
      );

  Map<String, dynamic> toJson() => {
        "idPersona": idPersona,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "telefono": telefono,
        "seguroMedico": seguroMedico,
        "seguroMedicoNumero": seguroMedicoNumero,
        "ruc": ruc,
        "cedula": cedula,
        "tipoPersona":
            tipoPersona == null ? null : tipoPersonaValues.reverse[tipoPersona],
        "usuarioLogin": usuarioLogin == null
            ? null
            : usuarioLoginValues.reverse[usuarioLogin],
        "idLocalDefecto":
            idLocalDefecto == null ? null : idLocalDefecto?.toJson(),
        "flagVendedor":
            flagVendedor == null ? null : flagValues.reverse[flagVendedor],
        "flagTaxfree": flagTaxfree,
        "flagExcepcionChequeoVenta": flagExcepcionChequeoVenta == null
            ? null
            : flagValues.reverse[flagExcepcionChequeoVenta],
        "observacion": observacion,
        "direccion": direccion,
        "idCiudad": idCiudad,
        "tipoCliente":
            tipoCliente == null ? null : tipoClienteValues.reverse[tipoCliente],
        "fechaHoraAprobContrato": fechaHoraAprobContrato,
        "soloUsuariosDelSistema": soloUsuariosDelSistema,
        "soloPersonasTaxfree": soloPersonasTaxfree,
        "nombreCompleto": nombreCompleto,
        "limiteCredito": limiteCredito,
        "fechaNacimiento": fechaNacimiento == null
            ? null
            : "${fechaNacimiento?.year.toString().padLeft(4, '0')}-${fechaNacimiento!.month.toString().padLeft(2, '0')}-${fechaNacimiento!.day.toString().padLeft(2, '0')}",
        "soloProximosCumpleanhos": soloProximosCumpleanhos,
        "todosLosCampos": todosLosCampos,
        "incluirLimiteDeCredito": incluirLimiteDeCredito,
        "deuda": deuda,
        "saldo": saldo,
        "creditos": creditos,
      };
}

class IdLocal {
  IdLocal({
    required this.idLocal,
    required this.nombre,
    required this.flagCasaCentral,
    required this.cantidadIngreso,
    required this.anhoMesActual,
    this.fechaHoraUltimoIngreso,
    required this.minutosSesion,
    this.nombreEmpresa,
    this.urlImagen,
    this.secuencia,
    this.pin,
    this.appMovil,
    this.qr,
    this.qrSoloEvaluacion,
    this.moneda,
    this.evaluacionItem,
    this.evaluacionLocal,
    this.habilitarFacebook,
    this.habilitarDatosManualmente,
    this.habilitarAnonimo,
    this.mostrarPreciosEnAccesoPublico,
    this.habilitarReserva,
    this.habilitarPedidosEnLocal,
    this.habilitarPedidosParaLlevar,
    this.habilitarPedidosDelivery,
    this.habilitarLlamarAlMozo,
    this.textoLamarAlMozo,
    this.textoRealizarPedido,
    this.recurso,
    this.flagRequiereAutorizacion,
    this.solicitarRucEnPedidos,
    this.costoDelivery,
    this.radioCoberturaDelivery,
    this.tiempoEntregaDelivery,
    this.posicionMapa,
    this.horaApertura,
    this.horaCierre,
    this.horariosEntregas,
    this.ultimaPublicacionShowMoreWeb,
  });

  final int idLocal;
  final Nombre? nombre;
  final Flag? flagCasaCentral;
  final int cantidadIngreso;
  final String anhoMesActual;
  final DateTime? fechaHoraUltimoIngreso;
  final int minutosSesion;
  final dynamic nombreEmpresa;
  final dynamic urlImagen;
  final dynamic secuencia;
  final dynamic pin;
  final dynamic appMovil;
  final dynamic qr;
  final dynamic qrSoloEvaluacion;
  final dynamic moneda;
  final dynamic evaluacionItem;
  final dynamic evaluacionLocal;
  final dynamic habilitarFacebook;
  final dynamic habilitarDatosManualmente;
  final dynamic habilitarAnonimo;
  final dynamic mostrarPreciosEnAccesoPublico;
  final dynamic habilitarReserva;
  final dynamic habilitarPedidosEnLocal;
  final dynamic habilitarPedidosParaLlevar;
  final dynamic habilitarPedidosDelivery;
  final dynamic habilitarLlamarAlMozo;
  final dynamic textoLamarAlMozo;
  final dynamic textoRealizarPedido;
  final dynamic recurso;
  final dynamic flagRequiereAutorizacion;
  final dynamic solicitarRucEnPedidos;
  final dynamic costoDelivery;
  final dynamic radioCoberturaDelivery;
  final dynamic tiempoEntregaDelivery;
  final dynamic posicionMapa;
  final dynamic horaApertura;
  final dynamic horaCierre;
  final dynamic horariosEntregas;
  final dynamic ultimaPublicacionShowMoreWeb;

  factory IdLocal.fromJson(Map<String, dynamic> json) => IdLocal(
        idLocal: json["idLocal"],
        nombre:
            json["nombre"] == null ? null : nombreValues.map[json["nombre"]],
        flagCasaCentral: json["flagCasaCentral"] == null
            ? null
            : flagValues.map[json["flagCasaCentral"]],
        cantidadIngreso: json["cantidadIngreso"],
        anhoMesActual: json["anhoMesActual"],
        fechaHoraUltimoIngreso: json["fechaHoraUltimoIngreso"] == null
            ? null
            : DateTime.parse(json["fechaHoraUltimoIngreso"]),
        minutosSesion: json["minutosSesion"],
        nombreEmpresa: json["nombreEmpresa"],
        urlImagen: json["urlImagen"],
        secuencia: json["secuencia"],
        pin: json["pin"],
        appMovil: json["appMovil"],
        qr: json["qr"],
        qrSoloEvaluacion: json["qrSoloEvaluacion"],
        moneda: json["moneda"],
        evaluacionItem: json["evaluacionItem"],
        evaluacionLocal: json["evaluacionLocal"],
        habilitarFacebook: json["habilitarFacebook"],
        habilitarDatosManualmente: json["habilitarDatosManualmente"],
        habilitarAnonimo: json["habilitarAnonimo"],
        mostrarPreciosEnAccesoPublico: json["mostrarPreciosEnAccesoPublico"],
        habilitarReserva: json["habilitarReserva"],
        habilitarPedidosEnLocal: json["habilitarPedidosEnLocal"],
        habilitarPedidosParaLlevar: json["habilitarPedidosParaLlevar"],
        habilitarPedidosDelivery: json["habilitarPedidosDelivery"],
        habilitarLlamarAlMozo: json["habilitarLlamarAlMozo"],
        textoLamarAlMozo: json["textoLamarAlMozo"],
        textoRealizarPedido: json["textoRealizarPedido"],
        recurso: json["recurso"],
        flagRequiereAutorizacion: json["flagRequiereAutorizacion"],
        solicitarRucEnPedidos: json["solicitarRucEnPedidos"],
        costoDelivery: json["costoDelivery"],
        radioCoberturaDelivery: json["radioCoberturaDelivery"],
        tiempoEntregaDelivery: json["tiempoEntregaDelivery"],
        posicionMapa: json["posicionMapa"],
        horaApertura: json["horaApertura"],
        horaCierre: json["horaCierre"],
        horariosEntregas: json["horariosEntregas"],
        ultimaPublicacionShowMoreWeb: json["ultimaPublicacionShowMoreWeb"],
      );

  Map<String, dynamic> toJson() => {
        "idLocal": idLocal,
        "nombre": nombre == null ? null : nombreValues.reverse[nombre],
        "flagCasaCentral": flagCasaCentral == null
            ? null
            : flagValues.reverse[flagCasaCentral],
        "cantidadIngreso": cantidadIngreso,
        "anhoMesActual": anhoMesActual,
        "fechaHoraUltimoIngreso": fechaHoraUltimoIngreso == null
            ? null
            : fechaHoraUltimoIngreso?.toIso8601String(),
        "minutosSesion": minutosSesion,
        "nombreEmpresa": nombreEmpresa,
        "urlImagen": urlImagen,
        "secuencia": secuencia,
        "pin": pin,
        "appMovil": appMovil,
        "qr": qr,
        "qrSoloEvaluacion": qrSoloEvaluacion,
        "moneda": moneda,
        "evaluacionItem": evaluacionItem,
        "evaluacionLocal": evaluacionLocal,
        "habilitarFacebook": habilitarFacebook,
        "habilitarDatosManualmente": habilitarDatosManualmente,
        "habilitarAnonimo": habilitarAnonimo,
        "mostrarPreciosEnAccesoPublico": mostrarPreciosEnAccesoPublico,
        "habilitarReserva": habilitarReserva,
        "habilitarPedidosEnLocal": habilitarPedidosEnLocal,
        "habilitarPedidosParaLlevar": habilitarPedidosParaLlevar,
        "habilitarPedidosDelivery": habilitarPedidosDelivery,
        "habilitarLlamarAlMozo": habilitarLlamarAlMozo,
        "textoLamarAlMozo": textoLamarAlMozo,
        "textoRealizarPedido": textoRealizarPedido,
        "recurso": recurso,
        "flagRequiereAutorizacion": flagRequiereAutorizacion,
        "solicitarRucEnPedidos": solicitarRucEnPedidos,
        "costoDelivery": costoDelivery,
        "radioCoberturaDelivery": radioCoberturaDelivery,
        "tiempoEntregaDelivery": tiempoEntregaDelivery,
        "posicionMapa": posicionMapa,
        "horaApertura": horaApertura,
        "horaCierre": horaCierre,
        "horariosEntregas": horariosEntregas,
        "ultimaPublicacionShowMoreWeb": ultimaPublicacionShowMoreWeb,
      };
}

enum Nombre { CASA_CENTRAL }

final nombreValues = EnumValues({"Casa central": Nombre.CASA_CENTRAL});

enum TipoCliente { MINORISTA }

final tipoClienteValues = EnumValues({"MINORISTA": TipoCliente.MINORISTA});

enum TipoPersona { FISICA, JURIDICA }

final tipoPersonaValues = EnumValues(
    {"FISICA": TipoPersona.FISICA, "JURIDICA": TipoPersona.JURIDICA});

enum UsuarioLogin { USUARIO1, USUARIO5, USUARIO100, USUARIO3 }

final usuarioLoginValues = EnumValues({
  "usuario1": UsuarioLogin.USUARIO1,
  "usuario100": UsuarioLogin.USUARIO100,
  "usuario3": UsuarioLogin.USUARIO3,
  "usuario5": UsuarioLogin.USUARIO5
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
