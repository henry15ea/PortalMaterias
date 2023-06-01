//clase modelo para la respuesta de la api

import 'package:flutter/material.dart';

class perfilmodel{
  String u_nombre = '';
  String u_apellido;
  int u_edad;
  String u_tel;
  String u_dui;
  String u_nit;
  String u_carnet;
  String u_mail;
  String r_role;
  String cnombre;
  String m_nombre;

  perfilmodel({
    required this.u_nombre,
    required this.u_apellido,
    this.u_edad = 18,
    required this.u_tel,
    required this.u_dui,
    required this.u_nit,
    required this.u_carnet,
    required this.u_mail,
    required this.r_role,
    required this.cnombre,
    required this.m_nombre
  });

  factory perfilmodel.fromJson(Map<String, dynamic> item) {
    return perfilmodel(
      u_nombre: item["u_nombre"].toString(),
      u_apellido: item["u_apellido"].toString(),
      u_edad: item["u_edad"],
      u_tel: item["u_tel"].toString(),
      u_dui: item["u_dui"].toString(),
      u_nit: item["u_nit"].toString(),
      u_carnet: item["u_carnet"].toString(),
      u_mail: item["u_mail"].toString(),
      r_role: item["r_role"].toString(),
      cnombre: item["cnombre"].toString(),
      m_nombre: item["m_nombre"].toString()
    );
  }


}