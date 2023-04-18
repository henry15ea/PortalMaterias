import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/api_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginModel {
  String _userName = '';
  String _password = '';

  String _msgApi = '';

  String get userName => _userName;
  void set userName(String value) => _userName = value;

  String get password => _password;
  void set password(String value) => _password = value;

  String get msgApi => _msgApi;
  void set msgApi(String value) => _msgApi = value;


  Future<bool> fn_login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonResponse;
    // try {
    var url = Uri.http($_HostNamed, $routes['/login']);
    var response = await http.post(url, body: {
      'carnet_id': _userName,
      'password': _password
    });
   
    if (response.statusCode == 200) {
          jsonResponse = jsonDecode(response.body);
          var tokenStatus = jsonResponse['Estado']['tokenValidateStatus'];
          
          if (tokenStatus == true) {
             //print("Usuario : "+_userName + "  >> Pass : "+ _password);
            //token obtenido y es valido
            var token_id = jsonResponse['Estado']['token_id'];
            var usuario = jsonResponse['Estado']['data_api'];
            prefs.setString('token_id',token_id);
            prefs.setString('carnet_id',_userName);
            prefs.setString('username',usuario);
            
            _msgApi = 'Un gusto que estes de nuevo '+ usuario;
            
            return true;
          } else {
               _msgApi = jsonResponse['Info'];
            return false;
          }
    } else {
      return false;
    }

    // return 'oke '+response.status.toString();
  }

}
