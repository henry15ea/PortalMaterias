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
            Row(
              children: [
                Card(
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 25,),
                        Text('Facultades'),
                        SizedBox(height: 25,),
                      ],
                    ),
                  ),
                ),
                Card(
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 25,),
                        Text('Listado de carreras'),
                        SizedBox(height: 25,),
                      ],
                    ),
                  ),
                ),
              ],
            )

        ],
      )),
    );
  }
}