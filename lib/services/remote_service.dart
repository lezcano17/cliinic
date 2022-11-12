import 'dart:convert';

import 'package:cliinic/models/lista.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<Post?> getPersonas() async {
    var client = http.Client();

    var uri = Uri.parse('http://equipoyosh.com/stock-nutrinatalia/persona');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var datos = response.body;
      return postFromJson(datos);
    }
  }
}
