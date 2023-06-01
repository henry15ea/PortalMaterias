import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portaluni/fragments/modals/modalMateriasRel.dart';
import 'package:portaluni/models/materiasModel.dart';
import 'package:portaluni/utils/token.dart';
import 'dart:convert';
import '../modules/navbar.dart';
import '../utils/api_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class materiasByCarrera extends StatefulWidget {
  //materiasByCarrera({Key? key}) : super(key: key);

  @override
  _materiasByCarreraState createState() => _materiasByCarreraState();
}

class _materiasByCarreraState extends State<materiasByCarrera> {

late Future<List<materias>> _listadoMaterias;
Map<String, dynamic> _args = {};


  Future<List<materias>> fn_carre(String id_carreraData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonResponse;
    List<materias> mat=[];
   
    // try {
    var url = Uri.http($_HostNamed, $routes['/listado_materias']);
    var response = await http.post(url,body: {
      'token_id':prefs.get('token_id'),
      'carrera_id':id_carreraData.trim(),
      'carnet_id':prefs.get('carnet_id')
    });
   //carnet_id
print("conectando a "+url.toString());
print("Id carrera obtenido : "+ id_carreraData);

    if (response.statusCode == 200 || response.statusCode == 401) {
          print("La api ha retornado datos ");

          jsonResponse = jsonDecode(response.body);
          var tokenStatus = jsonResponse['Estado']['tokenValidateStatus'];

          if (tokenStatus == true) {
            for (var item in jsonResponse['Estado']['data_api']){
              mat.add(materias(
                  m_id: item["m_id"].toString(),
                  m_nombre: item["m_nombre"],
                  cnombre: item["cnombre"],
                  m_noid: item["m_noid"].toString(),
                  m_ciclo: item["m_ciclo"].toString(),
                  m_unvalorativas: item["m_unvalorativas"].toString(),
                  ht: item["ht"].toString(),
                  hts: item["hts"].toString(),
                  hps: item["hps"].toString(),
                  pensum_orden: item["pensum_orden"].toString()
                ));
            }
            
            
          } else {
            print("Error 1");
            return mat;
          }
    } else {
      print("Error 2");
      return mat;
    }
    return mat;
  }

  @override
  void initState() {
  super.initState();
 
}


  @override
  Widget build(BuildContext context) {
 final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
 //_args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
final String dataCarrera  = args['id_carrera'];
 _listadoMaterias = fn_carre(args['id_carrera']);
    return Scaffold(
      appBar: CustomAppBar(title: 'UTEC PORTAL',onPressed: ()=> print(''),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 192, 47, 144),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),


      body: FutureBuilder(
        future: _listadoMaterias,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            //print(snapshot.data);
            return ListView(
              children: _listadocarreras(snapshot.requireData,dataCarrera),
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

  List<Widget> _listadocarreras(List<materias>data, String id_carrera){
    List<Widget> mats=[];
    for(var car in data){
      mats.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 124, 26, 124),
                        child: Row(
                          
                          children: [
                            Text("Orden ["+car.pensum_orden+"]",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                            SizedBox(
                              width: 130,
                            ),
                            Text("Codigo ["+car.m_noid+"]",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextButton(
                            
                          onPressed: () async {
                                      final result = await showDialog(
                                        context: context,
                                        builder: (context) =>  MyAlertDialog(nmb_carrera: car.m_nombre, id_materia: car.m_id, id_carrera: id_carrera.trim()),
                                      );
                                      
                                    },
                                    child: Text(
                          car.m_nombre,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                          ),
                      ),

                        Container(
                        color: Color.fromARGB(255, 124, 26, 124),
                        child: Row(
                          
                          children: [
                            
                           
                            Text("UV ["+car.m_unvalorativas+"]",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  )
                          ],
                        ),
                      ),
                        
                    ],
                  ),
                ),
              ),
            ), 
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 97, 0, 69),
            ),
          ),
        )
      );
    }
    return mats;
  }

}
