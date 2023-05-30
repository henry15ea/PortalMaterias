import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portaluni/fragments/pantallacarreras.dart';
import 'package:portaluni/fragments/pantallafacultades.dart';
import 'package:portaluni/fragments/pantallausuario.dart';
import 'package:portaluni/modules/navbar.dart';
import 'dart:convert';
import '../utils/api_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class initialScreen extends StatefulWidget {

  @override
  _initialScreenState createState() => _initialScreenState();
}

class _initialScreenState extends State<initialScreen> {
  int currentPageIndex = 0; //index necesario para acceder a las opciones del tab
  SharedPreferences? preferences; // shared preferences

//metodo necesario para incializar shared preferences sin un await
 @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        preferences = prefs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
      String? username = preferences?.getString('username');

    return Scaffold(
      appBar: CustomAppBar(title: 'UTEC PORTAL',onPressed: ()=> print(''),),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
         });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'facultades',
          ),
           NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Carreras',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          NavigationDestination(
            //selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.info),
            label: 'Acerca',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.white30,
          alignment: Alignment.center,
          child: pantallaUsuario(),
        ),
        Container(
          color: Color.fromARGB(255, 232, 209, 245),
          alignment: Alignment.center,
          child: pantallafacultades(),
        ),
        Container(
          color: Color.fromARGB(255, 232, 209, 245),
          alignment: Alignment.center,
          child: pantallaCarreras()
        ),
        Container(
          color: Color.fromARGB(255, 232, 209, 245),
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
        Container(
          color: Color.fromARGB(255, 232, 209, 245),
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
      ][currentPageIndex],
    );
  }
}