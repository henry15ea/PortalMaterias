import 'package:flutter/material.dart';

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
        _fn_customItems(title)
      ],
    )
    );
  }
}

Container _fn_customItems(title){
return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(color: Color.fromARGB(255, 138, 0, 108)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: ()=>{},
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