import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function onPressed;

  CustomAppBar({required this.title, required this.onPressed});

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 88, 0, 62),
        body: Column(
      children: [
        SizedBox(height: 25,),
        _fn_customItems(title, context)
      ],
    )
    );
  }
}

Container _fn_customItems(title, contxt) {
return Container(
      height: 57,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(color: Color.fromARGB(255, 138, 0, 108)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          PopupMenuButton(
              itemBuilder: (BuildContext context)  {
                return [
                  PopupMenuItem(
                    child: Text('Cerrar sesion'),
                    value: 1,
                  ),
                ];
              },
              onSelected: (value) {
                      if (value == 1) {
                        showDialog(
                          context: contxt,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('¿Deseas salir?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Aceptar'),
                                  onPressed: () async {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.remove("token_id");
                                     prefs.remove("carnet_id");
                                    Navigator.popUntil(context, ModalRoute.withName('/'));
                                  },
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
              child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white, // Cambia el color del icono a blanco
                    ),
                  ),
            ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 50.0), 
          Image.asset('resources/profile_dev.png',height: 50,width: 50,),// Este espacio opcional agrega un margen entre el título y el botón de la derecha
          
        ],
      ),
    );

}