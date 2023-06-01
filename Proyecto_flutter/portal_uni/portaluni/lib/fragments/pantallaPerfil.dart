import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portaluni/models/perfilModel.dart';
import 'package:portaluni/utils/token.dart';
import 'dart:convert';
import '../modules/navbar.dart';
import '../utils/api_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PantallaPerfil extends StatefulWidget {
  //PantallaPerfil({Key? key}) : super(key: key);
  

  @override
  _PantallaPerfilState createState() => _PantallaPerfilState();
}

class _PantallaPerfilState extends State<PantallaPerfil> {

late Future<List<perfilmodel>> _listadoPerfilData;
var dataInfoUser;

Future<List<perfilmodel>> fn_perfilData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonResponse;
    List<perfilmodel> per=[];
   
    // try {
    var url = Uri.http($_HostNamed, $routes['/perfil']);
    var response = await http.post(url,body: {
      'token_id':prefs.get('token_id'),
      'carnet_id':prefs.get('carnet_id')
    });
	
   

    if (response.statusCode == 200 || response.statusCode == 401) {
          jsonResponse = jsonDecode(response.body);
          var tokenStatus = jsonResponse['Estado']['tokenValidateStatus'];

          if (tokenStatus == true) {
            var data_api = jsonResponse['Estado']['data_api'];
            this.dataInfoUser = perfilmodel.fromJson(data_api);
            
            per.add(perfilmodel(
              u_nombre: this.dataInfoUser.u_nombre,
              u_apellido: this.dataInfoUser.u_apellido,
              u_tel: this.dataInfoUser.u_tel,
              u_dui: this.dataInfoUser.u_dui,
              u_nit: this.dataInfoUser.u_nit,
              u_carnet: this.dataInfoUser.u_carnet,
              u_mail: this.dataInfoUser.u_mail,
              r_role: this.dataInfoUser.r_role,
              cnombre: this.dataInfoUser.cnombre,
              m_nombre: this.dataInfoUser.m_nombre
              )
              );
            
          } else {
            print("Error 1");
            return per;
          }
    } else {
      print("Error 2");
      return per;
    }
    return per;
  }
  
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _listadoPerfilData=fn_perfilData();
  }
 @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<perfilmodel>>(
      future: _listadoPerfilData,
      builder: (BuildContext context, AsyncSnapshot<List<perfilmodel>> snapshot) {
        if (snapshot.hasData) {
          // extract required data from List<PerfilModel> and display it as needed
          return Column(
            children: snapshot.data!.map((perfil) {
              return SingleChildScrollView(
                child: Card(
                  child: 
                    SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Container(
                              height: 430,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    child: ListTile(
                                      leading: Icon(Icons.person),
                                      title: Text('Nombre'),
                                      subtitle: Text('${perfil.u_nombre} ${perfil.u_apellido}'),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    child: ListTile(
                                      leading: Icon(Icons.document_scanner),
                                      title: Text('DUI'),
                                      subtitle: Text('${perfil.u_dui}'),
                                    ),
                                  ),
                                     Container(
                                    height: 60,
                                    child: ListTile(
                                      leading: Icon(Icons.tag_faces),
                                      title: Text('USUARIO'),
                                      subtitle: Text('${perfil.r_role}'),
                                    ),
                                  ),
                                   Container(
                                    height: 60,
                                    child: ListTile(
                                      leading: Icon(Icons.numbers),
                                      title: Text('EDAD'),
                                      subtitle: Text('${perfil.u_edad}'),
                                    ),
                                  ),
                                   Container(
                                    height: 60,
                                    child: ListTile(
                                      leading: Icon(Icons.phone),
                                      title: Text('Telefono'),
                                      subtitle: Text('${perfil.u_tel}'),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    child: ListTile(
                                      leading: Icon(Icons.diamond),
                                      title: Text('Carrera'),
                                      subtitle: Text('${perfil.cnombre}'),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    child: ListTile(
                                      leading: Icon(Icons.mail),
                                      title: Text('Correo'),
                                      subtitle: Text('${perfil.u_mail}'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        )
                    )
                  )
                  ,);
            }).toList(),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}