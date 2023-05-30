import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portaluni/models/carrerasModel.dart';
import 'package:portaluni/utils/token.dart';
import 'dart:convert';
import '../utils/api_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pantallaCarreras extends StatefulWidget {
  const pantallaCarreras({super.key});

  @override
  State<pantallaCarreras> createState() => _pantallaCarrerasState();
}

class _pantallaCarrerasState extends State<pantallaCarreras> {

  late Future<List<carreras>> _listacarreras;

  Future<List<carreras>> fn_carre() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonResponse;
    List<carreras> cars=[];
    print("token:_____________________________________");
    print(prefs.get('token_id'));
    print("token:_____________________________________");
    // try {
    var url = Uri.http($_HostNamed, $routes['/carreras']);
    var response = await http.post(url,body: {
      'token_id':prefs.get('token_id')
    });
   
    if (response.statusCode == 200) {
          jsonResponse = jsonDecode(response.body);
          var tokenStatus = jsonResponse['Estado']['tokenValidateStatus'];
          print(jsonResponse['Estado']['data_api']);
          if (tokenStatus == true) {
            for (var item in jsonResponse['Estado']['data_api']){
              cars.add(carreras(cid:item['cid'],cnombre:item['cnombre']));
            }
            
            
          } else {
            print("Error 1");
            return cars;
          }
    } else {
      print("Error 2");
      return cars;
    }
    return cars;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _listacarreras=fn_carre();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _listacarreras,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            //print(snapshot.data);
            return ListView(
              children: _listadocarreras(snapshot.requireData),
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

  List<Widget> _listadocarreras(List<carreras>data){
    List<Widget> carss=[];
    for(var car in data){
      carss.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Text(
                car.cnombre,
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
    return carss;
  }

}