import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portaluni/models/materiasRelModel.dart';
import 'package:portaluni/utils/token.dart';
import 'dart:convert';
import '../../modules/navbar.dart';
import '../../utils/api_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAlertDialog extends StatefulWidget {
  //const MyAlertDialog({Key? key}) : super(key: key);
  final String id_materia;
  final String id_carrera;
   final String nmb_carrera;

  MyAlertDialog({required this.nmb_carrera,required this.id_materia, required this.id_carrera});

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {


late Future<List<materias>> _listadoMaterias;

  Future<List<materias>> fn_materiasRel(String idMateria, String idCarrera) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonResponse;
    List<materias> mat=[];
    print("token:_____________________________________");
    print(prefs.get('token_id'));
    print("ID materia "+widget.id_materia);
    print("ID carrera "+widget.id_carrera);
    print("token:_____________________________________");
    print("token Actual :"+prefs.get('token_id').toString());
    // try {
    var url = Uri.http($_HostNamed, $routes['/listado_materias_rel']);
    var response = await http.post(url,body: {
      'token_id':prefs.get('token_id'),
      'carrera_id':widget.id_carrera.trim(),
      'carnet_id':prefs.get('carnet_id'),
      'materia_id':widget.id_materia.trim()
    });
   //carnet_id
print("Respondiendo en : ");
print(url);
print("------------------------------------");

    if (response.statusCode == 200 || response.statusCode == 401) {
          jsonResponse = jsonDecode(response.body);
          var tokenStatus = jsonResponse['estado']['tokenValidateStatus'];

          if (tokenStatus == true) {
            for (var item in jsonResponse['estado']['data_api']){
              mat.add(materias(
                  m_id: item["m_id"].toString(),
                  m_nombre: item["m_nombre"],
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
    // TODO: implement initState
    super.initState();
    
    
  }

  @override
  Widget build(BuildContext context) {
    final dialogWidth = MediaQuery.of(context).size.width * 0.1; // ancho del diálogo
    _listadoMaterias=fn_materiasRel(widget.id_materia,widget.id_carrera);

    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Ink(
                  height: 32,
                    decoration: ShapeDecoration(
                      color: Color.fromARGB(255, 255, 254, 255),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      color:Color.fromARGB(255, 66, 0, 75),
                      onPressed: () => Navigator.pop(context, 'OK'),
                    ),
                  ),

                SizedBox(width: 25,),
                Text(
                  "Prerrequisito",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: 320,
              color: Colors.amber,
              child: Text(
                    widget.nmb_carrera,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
            ),
          SingleChildScrollView(
              child: SizedBox(
                height: 360, // adjust this value to your desired height
                child: FutureBuilder(
                  future: _listadoMaterias,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        children: _listadocarreras(snapshot.requireData),
                      );
                    } else if (snapshot.hasError) {
                      return Text("error");
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  List<Widget> _listadocarreras(List<materias>data){
    List<Widget> mats=[];
    for(var car in data){
      mats.add(
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            child: Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 124, 26, 124),
                        child: Row(
                          
                          children: [
                            
                            SizedBox(
                              width: 5,
                            ),
                            Text("Codigo ["+car.m_noid+"]",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  )
                          ],
                        ),
                      ),

                      Container(
                        height: 110,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            car.m_nombre,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            
                        ),
                      ),

                        Container(
                        color: Color.fromARGB(255, 124, 26, 124),
                        child: Row(
                          
                          children: [
                            
                           Text("Orden ["+car.pensum_orden+"]",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 100,),
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
            height: 160,
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



