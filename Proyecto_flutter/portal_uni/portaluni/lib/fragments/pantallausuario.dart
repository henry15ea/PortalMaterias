import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portaluni/modules/navbar.dart';
import 'dart:convert';
import '../utils/api_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pantallaUsuario extends StatefulWidget {
 // pantallaUsuario({Key? key}) : super(key: key);

  @override
  _pantallaUsuarioState createState() => _pantallaUsuarioState();
}

class _pantallaUsuarioState extends State<pantallaUsuario> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Scrollbar(child: Column(
        children: [
            Container(
              color: Color.fromARGB(255, 221, 201, 228),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Bienvenido nuevamente')

                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                            width: 360.0,
                            color: Color.fromARGB(255, 250, 247, 249),
                            child: 
                                Image.network("https://www.utec.edu.sv/assets/img/slides/180423/2.jpg", height: 220, width: 320,),
                    ),
                     ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                            height: 150,
                            child: ListView(
                                    // This next line does the trick.
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                     
                                      Card(
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage("https://www.utec.edu.sv/assets/img/img_destacado_01.jpg"),
                                                    fit: BoxFit.cover, // ajusta la imagen al tamaño del Container
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0, // ajusta la posición del texto dentro de la card
                                                left: 0,
                                                right: 0,
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  color: Colors.black.withOpacity(0.5), // un fondo opaco para ayudar a destacar el texto
                                                  child: Text(
                                                    "Nuevo Ingreso",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                     Card(
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage("https://www.utec.edu.sv/assets/img/img_destacado_02.jpg"),
                                                    fit: BoxFit.cover, // ajusta la imagen al tamaño del Container
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0, // ajusta la posición del texto dentro de la card
                                                left: 0,
                                                right: 0,
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  color: Colors.black.withOpacity(0.5), // un fondo opaco para ayudar a destacar el texto
                                                  child: Text(
                                                    "Graduados",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Card(
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage("https://www.utec.edu.sv/assets/img/img_destacado_03.jpg"),
                                                    fit: BoxFit.cover, // ajusta la imagen al tamaño del Container
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0, // ajusta la posición del texto dentro de la card
                                                left: 0,
                                                right: 0,
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  color: Colors.black.withOpacity(0.5), // un fondo opaco para ayudar a destacar el texto
                                                  child: Text(
                                                    "Utec Internacional",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Card(
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage("https://www.utec.edu.sv/assets/img/img_destacado_04.jpg"),
                                                    fit: BoxFit.cover, // ajusta la imagen al tamaño del Container
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0, // ajusta la posición del texto dentro de la card
                                                left: 0,
                                                right: 0,
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  color: Colors.black.withOpacity(0.5), // un fondo opaco para ayudar a destacar el texto
                                                  child: Text(
                                                    "Investigación y Proyección Social",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                          ),
                    ),
                  ],


                ),
              ),
        ],
      )),
    );
  }
}