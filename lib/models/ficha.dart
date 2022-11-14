// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Ficha fichaFromJson(String str) => Ficha.fromJson(json.decode(str));

String fichaToJson(Ficha data) => json.encode(data.toJson());

class Ficha {
  Ficha({
    required this.ficha,
    required this.totalDatos,
  });

  List<Lista> ficha;
  int totalDatos;

  factory Ficha.fromJson(Map<String, dynamic> json) => Ficha(
        ficha: List<Lista>.from(json["lista"].map((x) => Lista.fromJson(x))),
        totalDatos: json["totalDatos"],
      );

  Map<String, dynamic> toJson() => {
        "lista": List<dynamic>.from(ficha.map((x) => x.toJson())),
        "totalDatos": totalDatos,
      };
}

class Lista {
  Lista({
    required this.idFichaClinica,
    required this.fechaHora,
    required this.motivoConsulta,
    required this.diagnostico,
    required this.observacion,
    required this.idLocal,
    required this.idEmpleado,
    required this.idCliente,
    required this.idTipoProducto,
    required this.fechaHoraCadena,
    required this.fechaHoraCadenaFormateada,
    this.fechaDesdeCadena,
    this.fechaHastaCadena,
    this.todosLosCampos,
  });

  int idFichaClinica;
  DateTime fechaHora;
  String motivoConsulta;
  String diagnostico;
  String? observacion;
  IdLocal idLocal;
  Id idEmpleado;
  Id idCliente;
  IdTipoProducto idTipoProducto;
  String fechaHoraCadena;
  String fechaHoraCadenaFormateada;
  dynamic fechaDesdeCadena;
  dynamic fechaHastaCadena;
  dynamic todosLosCampos;

  factory Lista.fromJson(Map<String, dynamic> json) => Lista(
        idFichaClinica: json["idFichaClinica"],
        fechaHora: DateTime.parse(json["fechaHora"]),
        motivoConsulta: json["motivoConsulta"],
        diagnostico: json["diagnostico"],
        observacion: json["observacion"] == null ? null : json["observacion"],
        idLocal: IdLocal.fromJson(json["idLocal"]),
        idEmpleado: Id.fromJson(json["idEmpleado"]),
        idCliente: Id.fromJson(json["idCliente"]),
        idTipoProducto: IdTipoProducto.fromJson(json["idTipoProducto"]),
        fechaHoraCadena: json["fechaHoraCadena"],
        fechaHoraCadenaFormateada: json["fechaHoraCadenaFormateada"],
        fechaDesdeCadena: json["fechaDesdeCadena"],
        fechaHastaCadena: json["fechaHastaCadena"],
        todosLosCampos: json["todosLosCampos"],
      );

  Map<String, dynamic> toJson() => {
        "idFichaClinica": idFichaClinica,
        "fechaHora": fechaHora.toIso8601String(),
        "motivoConsulta": motivoConsulta,
        "diagnostico": diagnostico,
        "observacion": observacion == null ? null : observacion,
        "idLocal": idLocal.toJson(),
        "idEmpleado": idEmpleado.toJson(),
        "idCliente": idCliente.toJson(),
        "idTipoProducto": idTipoProducto.toJson(),
        "fechaHoraCadena": fechaHoraCadena,
        "fechaHoraCadenaFormateada": fechaHoraCadenaFormateada,
        "fechaDesdeCadena": fechaDesdeCadena,
        "fechaHastaCadena": fechaHastaCadena,
        "todosLosCampos": todosLosCampos,
      };
}

class Id {
  Id({
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
  UsuarioLogin? usuarioLogin;
  IdLocal? idLocalDefecto;
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
  String nombreCompleto;
  num? limiteCredito;
  DateTime? fechaNacimiento;
  dynamic soloProximosCumpleanhos;
  dynamic todosLosCampos;
  dynamic incluirLimiteDeCredito;
  dynamic deuda;
  dynamic saldo;
  dynamic creditos;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        idPersona: json["idPersona"],
        nombre: json["nombre"],
        apellido: json["apellido"] == null ? null : json["apellido"],
        email: json["email"] == null ? null : json["email"],
        telefono: json["telefono"] == null ? null : json["telefono"],
        seguroMedico: json["seguroMedico"],
        seguroMedicoNumero: json["seguroMedicoNumero"],
        ruc: json["ruc"] == null ? null : json["ruc"],
        cedula: json["cedula"] == null ? null : json["cedula"],
        tipoPersona: tipoPersonaValues.map[json["tipoPersona"]],
        usuarioLogin: json["usuarioLogin"] == null
            ? null
            : usuarioLoginValues.map[json["usuarioLogin"]],
        idLocalDefecto: json["idLocalDefecto"] == null
            ? null
            : IdLocal.fromJson(json["idLocalDefecto"]),
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
        "apellido": apellido == null ? null : apellido,
        "email": email == null ? null : email,
        "telefono": telefono == null ? null : telefono,
        "seguroMedico": seguroMedico,
        "seguroMedicoNumero": seguroMedicoNumero,
        "ruc": ruc == null ? null : ruc,
        "cedula": cedula == null ? null : cedula,
        "tipoPersona": tipoPersonaValues.reverse[tipoPersona],
        "usuarioLogin": usuarioLogin == null
            ? null
            : usuarioLoginValues.reverse[usuarioLogin],
        "idLocalDefecto":
            idLocalDefecto == null ? null : idLocalDefecto!.toJson(),
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

enum Flag { S, N }

final flagValues = EnumValues({"N": Flag.N, "S": Flag.S});

class IdLocal {
  IdLocal({
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
  Nombre? nombre;
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

  factory IdLocal.fromJson(Map<String, dynamic> json) => IdLocal(
        idLocal: json["idLocal"],
        nombre: nombreValues.map[json["nombre"]],
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
        "nombre": nombreValues.reverse[nombre],
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

enum Nombre { CASA_CENTRAL }

final nombreValues = EnumValues({"Casa central": Nombre.CASA_CENTRAL});

enum TipoCliente { MINORISTA }

final tipoClienteValues = EnumValues({"MINORISTA": TipoCliente.MINORISTA});

enum TipoPersona { FISICA, JURIDICA }

final tipoPersonaValues = EnumValues(
    {"FISICA": TipoPersona.FISICA, "JURIDICA": TipoPersona.JURIDICA});

enum UsuarioLogin { USUARIO100, USUARIO1, USUARIO5, USUARIO3 }

final usuarioLoginValues = EnumValues({
  "usuario1": UsuarioLogin.USUARIO1,
  "usuario100": UsuarioLogin.USUARIO100,
  "usuario3": UsuarioLogin.USUARIO3,
  "usuario5": UsuarioLogin.USUARIO5
});

class IdTipoProducto {
  IdTipoProducto({
    required this.idTipoProducto,
    required this.descripcion,
    required this.flagVisible,
    required this.idCategoria,
    required this.posicion,
  });

  int idTipoProducto;
  String descripcion;
  Flag? flagVisible;
  IdCategoria idCategoria;
  int posicion;

  factory IdTipoProducto.fromJson(Map<String, dynamic> json) => IdTipoProducto(
        idTipoProducto: json["idTipoProducto"],
        descripcion: json["descripcion"],
        flagVisible: flagValues.map[json["flagVisible"]],
        idCategoria: IdCategoria.fromJson(json["idCategoria"]),
        posicion: json["posicion"],
      );

  Map<String, dynamic> toJson() => {
        "idTipoProducto": idTipoProducto,
        "descripcion": descripcion,
        "flagVisible": flagValues.reverse[flagVisible],
        "idCategoria": idCategoria.toJson(),
        "posicion": posicion,
      };
}

class IdCategoria {
  IdCategoria({
    required this.idCategoria,
    required this.descripcion,
    required this.flagVisible,
    required this.posicion,
  });

  int idCategoria;
  String descripcion;
  Flag? flagVisible;
  int posicion;

  factory IdCategoria.fromJson(Map<String, dynamic> json) => IdCategoria(
        idCategoria: json["idCategoria"],
        descripcion: json["descripcion"],
        flagVisible: flagValues.map[json["flagVisible"]],
        posicion: json["posicion"],
      );

  Map<String, dynamic> toJson() => {
        "idCategoria": idCategoria,
        "descripcion": descripcion,
        "flagVisible": flagValues.reverse[flagVisible],
        "posicion": posicion,
      };
}

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
