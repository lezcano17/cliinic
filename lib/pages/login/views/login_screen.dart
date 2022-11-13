import 'dart:developer';

import 'package:cliinic/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../../../models/lista.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  TextEditingController usuarioController = new TextEditingController();

  validate_user(String email_usuario) async {
    Post? personas = await RemoteService().getPersonas();
    if (personas != null) {
      print(personas.lista);
      print(email_usuario.runtimeType);
      for (final person in personas.lista) {
        var persona_actual = person;
        //print(persona_actual.nombre);
        if (persona_actual.email == email_usuario && email_usuario != '') {
          Get.offNamed(Routes.getHomeRoute());
        }
      }
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String nombreUsuario;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.width * 0.20,
                ),
                TextField(
                  controller: usuarioController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Ingrese Su correo o numero de telefono',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(20),
                      child: FaIcon(FontAwesomeIcons.envelope),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusColor: Colors.cyan,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'contraseña',
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(20),
                      child: FaIcon(FontAwesomeIcons.key),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    focusColor: Colors.cyan,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                const Divider(
                  height: 60,
                  color: Colors.white,
                ),
                ElevatedButton(
                  onPressed: () => {validate_user(usuarioController.text)},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: Colors.cyan),
                  child: SizedBox(
                    width: size.width * 0.4,
                    height: size.width * 0.13,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("has olvidado tu contraseña ?"),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
