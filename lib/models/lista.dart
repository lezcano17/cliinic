// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.lista,
    required this.totalDatos,
  });

  List<Lista> lista;
  int totalDatos;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        lista: List<Lista>.from(json["lista"].map((x) => Lista.fromJson(x))),
        totalDatos: json["totalDatos"],
      );

  Map<String, dynamic> toJson() => {
        "lista": List<dynamic>.from(lista.map((x) => x.toJson())),
        "totalDatos": totalDatos,
      };
}

class Lista {
  Lista({
    required this.idPersona,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.telefono,
    this.seguroMedico,
    this.seguroMedicoNumero,
    required this.ruc,
    required this.cedula,
    required this.tipoPersona,
    required this.usuarioLogin,
    required this.idLocalDefecto,
    required this.flagVendedor,
    this.flagTaxfree,
    required this.flagExcepcionChequeoVenta,
    this.observacion,
    this.direccion,
    this.idCiudad,
    required this.tipoCliente,
    this.fechaHoraAprobContrato,
    this.soloUsuariosDelSistema,
    this.soloPersonasTaxfree,
    required this.nombreCompleto,
    required this.limiteCredito,
    required this.fechaNacimiento,
    this.soloProximosCumpleanhos,
    this.todosLosCampos,
    this.incluirLimiteDeCredito,
    this.deuda,
    this.saldo,
    this.creditos,
  });

  int idPersona;
  String? nombre;
  String? apellido;
  String? email;
  String? telefono;
  dynamic seguroMedico;
  dynamic seguroMedicoNumero;
  String? ruc;
  String? cedula;
  TipoPersona? tipoPersona;
  String? usuarioLogin;
  IdLocalDefecto? idLocalDefecto;
  Flag? flagVendedor;
  dynamic flagTaxfree;
  Flag? flagExcepcionChequeoVenta;
  dynamic observacion;
  dynamic direccion;
  dynamic idCiudad;
  TipoCliente? tipoCliente;
  dynamic fechaHoraAprobContrato;
  dynamic soloUsuariosDelSistema;
  dynamic soloPersonasTaxfree;
  String? nombreCompleto;
  double limiteCredito;
  DateTime? fechaNacimiento;
  dynamic soloProximosCumpleanhos;
  dynamic todosLosCampos;
  dynamic incluirLimiteDeCredito;
  dynamic deuda;
  dynamic saldo;
  dynamic creditos;

  factory Lista.fromJson(Map<String, dynamic> json) => Lista(
        idPersona: json["idPersona"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        telefono: json["telefono"],
        seguroMedico: json["seguroMedico"],
        seguroMedicoNumero: json["seguroMedicoNumero"],
        ruc: json["ruc"],
        cedula: json["cedula"],
        tipoPersona: tipoPersonaValues.map[json["tipoPersona"]],
        usuarioLogin: json["usuarioLogin"],
        idLocalDefecto: json["idLocalDefecto"] == null
            ? null
            : IdLocalDefecto.fromJson(json["idLocalDefecto"]),
        flagVendedor: flagValues.map[json["flagVendedor"]],
        flagTaxfree: json["flagTaxfree"],
        flagExcepcionChequeoVenta: json["flagExcepcionChequeoVenta"] == null
            ? null
            : flagValues.map[json["flagExcepcionChequeoVenta"]],
        observacion: json["observacion"],
        direccion: json["direccion"],
        idCiudad: json["idCiudad"],
        tipoCliente: tipoClienteValues.map[json["tipoCliente"]],
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
        "tipoPersona": tipoPersonaValues.reverse[tipoPersona],
        "usuarioLogin": usuarioLogin,
        "idLocalDefecto":
            idLocalDefecto == null ? null : idLocalDefecto?.toJson(),
        "flagVendedor": flagValues.reverse[flagVendedor],
        "flagTaxfree": flagTaxfree,
        "flagExcepcionChequeoVenta": flagExcepcionChequeoVenta == null
            ? null
            : flagValues.reverse[flagExcepcionChequeoVenta],
        "observacion": observacion,
        "direccion": direccion,
        "idCiudad": idCiudad,
        "tipoCliente": tipoClienteValues.reverse[tipoCliente],
        "fechaHoraAprobContrato": fechaHoraAprobContrato,
        "soloUsuariosDelSistema": soloUsuariosDelSistema,
        "soloPersonasTaxfree": soloPersonasTaxfree,
        "nombreCompleto": nombreCompleto,
        "limiteCredito": limiteCredito,
        "fechaNacimiento": fechaNacimiento == null
            ? null
            : "${fechaNacimiento!.year.toString().padLeft(4, '0')}-${fechaNacimiento!.month.toString().padLeft(2, '0')}-${fechaNacimiento!.day.toString().padLeft(2, '0')}",
        "soloProximosCumpleanhos": soloProximosCumpleanhos,
        "todosLosCampos": todosLosCampos,
        "incluirLimiteDeCredito": incluirLimiteDeCredito,
        "deuda": deuda,
        "saldo": saldo,
        "creditos": creditos,
      };
}

enum Flag { N, S }

final flagValues = EnumValues({"N": Flag.N, "S": Flag.S});

class IdLocalDefecto {
  IdLocalDefecto({
    required this.idLocal,
    required this.nombre,
    required this.flagCasaCentral,
    required this.cantidadIngreso,
    required this.anhoMesActual,
    required this.fechaHoraUltimoIngreso,
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

  int idLocal;
  String nombre;
  Flag? flagCasaCentral;
  int cantidadIngreso;
  String anhoMesActual;
  DateTime fechaHoraUltimoIngreso;
  int minutosSesion;
  dynamic nombreEmpresa;
  dynamic urlImagen;
  dynamic secuencia;
  dynamic pin;
  dynamic appMovil;
  dynamic qr;
  dynamic qrSoloEvaluacion;
  dynamic moneda;
  dynamic evaluacionItem;
  dynamic evaluacionLocal;
  dynamic habilitarFacebook;
  dynamic habilitarDatosManualmente;
  dynamic habilitarAnonimo;
  dynamic mostrarPreciosEnAccesoPublico;
  dynamic habilitarReserva;
  dynamic habilitarPedidosEnLocal;
  dynamic habilitarPedidosParaLlevar;
  dynamic habilitarPedidosDelivery;
  dynamic habilitarLlamarAlMozo;
  dynamic textoLamarAlMozo;
  dynamic textoRealizarPedido;
  dynamic recurso;
  dynamic flagRequiereAutorizacion;
  dynamic solicitarRucEnPedidos;
  dynamic costoDelivery;
  dynamic radioCoberturaDelivery;
  dynamic tiempoEntregaDelivery;
  dynamic posicionMapa;
  dynamic horaApertura;
  dynamic horaCierre;
  dynamic horariosEntregas;
  dynamic ultimaPublicacionShowMoreWeb;

  factory IdLocalDefecto.fromJson(Map<String, dynamic> json) => IdLocalDefecto(
        idLocal: json["idLocal"],
        nombre: json["nombre"],
        flagCasaCentral: flagValues.map[json["flagCasaCentral"]],
        cantidadIngreso: json["cantidadIngreso"],
        anhoMesActual: json["anhoMesActual"],
        fechaHoraUltimoIngreso: DateTime.parse(json["fechaHoraUltimoIngreso"]),
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
        "nombre": nombre,
        "flagCasaCentral": flagValues.reverse[flagCasaCentral],
        "cantidadIngreso": cantidadIngreso,
        "anhoMesActual": anhoMesActual,
        "fechaHoraUltimoIngreso": fechaHoraUltimoIngreso.toIso8601String(),
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

enum TipoCliente { MINORISTA }

final tipoClienteValues = EnumValues({"MINORISTA": TipoCliente.MINORISTA});

enum TipoPersona { FISICA, JURIDICA }

final tipoPersonaValues = EnumValues(
    {"FISICA": TipoPersona.FISICA, "JURIDICA": TipoPersona.JURIDICA});

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
