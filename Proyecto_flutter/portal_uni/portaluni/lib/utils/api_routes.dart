import 'package:flutter/material.dart';

/*
  Esta clase sera necesario para establecer las rutas de comunicacion a la api 
 */
  String $_HostNamed = "192.168.43.63:8012";

Map<String, dynamic> $routes ={
    "/test": "/portal/public/test",
    "/login": "/portal/public/login",
    "/facultades":  "/portal/public/facultadlist",
    "/carreras": "/portal/public/carreralist",
    "/listado_materias": "/portal/public/listadomaterias",
    "/listado_materias_rel": "/portal/public/materialrel",
    "/perfil": "/portal/public/perfil"
 };

class RoutesApi{
  
  
  RoutesApi(bool $enableLocal, String $_Host, bool $_EnabledSecureConex){

    switch ($enableLocal){
      case true:
        $_HostNamed ="localhost";
        break;
      case true:
          if($_EnabledSecureConex == true){
              $_HostNamed = ""+$_Host.trim();
          }else{
              $_HostNamed = ""+$_Host.trim();
          }
        
        break;
      default:
       $_HostNamed ="localhost";
        break;
    }
  }


}