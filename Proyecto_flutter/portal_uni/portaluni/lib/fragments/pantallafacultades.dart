import 'package:flutter/material.dart';
import 'package:portaluni/models/facultadesModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/api_routes.dart';
import 'dart:convert';

class pantallafacultades extends StatefulWidget {
  const pantallafacultades({super.key});

  @override
  State<pantallafacultades> createState() => _pantallafacultadesState();
}

class _pantallafacultadesState extends State<pantallafacultades> {

 late Future<List<facultades>> _listafacultades;

 Future<List<facultades>> fn_facult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonResponse;
    List<facultades> facults=[];
    print(prefs.get('token_id'));
    // try {
    var url = Uri.http($_HostNamed, $routes['/facultades']);
    var response = await http.post(url,body: {
      'token_id':prefs.get('token_id')
    });
   
    if (response.statusCode == 200) {
          jsonResponse = jsonDecode(response.body);
          var tokenStatus = jsonResponse['Estado']['tokenValidateStatus'];
          print(jsonResponse['Estado']['data_api']);
          if (tokenStatus == true) {
            for (var item in jsonResponse['Estado']['data_api']){
              facults.add(facultades(f_detalle:item['f_detalle'],f_nombre:item['f_nombre']));
            }
            
            
          } else {
            print("Error 1");
            return facults;
          }
    } else {
      print("Error 2");
      return facults;
    }
    return facults;
  }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _listafacultades=fn_facult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _listafacultades,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            //print(snapshot.data);
            return ListView(
              children: _listadofacultades(snapshot.requireData),
            );
          }else if(snapshot.hasError){
            print(snapshot.error);
            return Text("error");
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }

    List<Widget> _listadofacultades(List<facultades>data){
    List<Widget> facults=[];
    for(var facu in data){
      facults.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Text(
                facu.f_nombre,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
                textAlign: TextAlign.center,
              ),
            ), 
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 97, 0, 69),
            ),
          ),
        )
      );
    }
    return facults;
  }
}