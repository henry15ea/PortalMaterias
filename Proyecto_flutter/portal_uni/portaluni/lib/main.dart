import 'package:flutter/material.dart';
import 'package:portaluni/utils/routes.dart';
import 'package:portaluni/frm_pantallas/frm_login.dart';
import 'package:portaluni/frm_pantallas/frm_initialscreen.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  //const Principal({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => frmLogin(), //pantalla de login
        '/Inicio': (context) =>
            initialScreen(), //pantalla principal de usuario (usuario ya esta logueado)
        '/facultades': (context) =>
            Principal(), //pantalla de listado de carreras
        '/carreras': (context) => Principal(), //pantalla de listado de carreras
        '/materias': (context) => Principal(), //pantalla de listado de materias
        '/perfil': (context) =>
            Principal(), //pantalla de listado de perfil de usuario
        '/acerca': (context) =>
            Principal(), //pantalla de listado de acerca de la aplicacion
      }
    );
  }
}
