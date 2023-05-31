import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portaluni/modules/topbar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../models/loginModel.dart';
import '../utils/api_routes.dart';
import 'package:http/http.dart' as http;

class frmLogin extends StatefulWidget {
  //frmLogin({Key? key}) : super(key: key);
  var $user_Data = loginModel();
  @override
  _frmLoginState createState() => _frmLoginState();
}

class _frmLoginState extends State<frmLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 205, 210),
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            topbar(),
            
            Container(
              height: 220,
              color: Color.fromARGB(255, 97, 0, 69),
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Image.asset(
                        'resources/utec_brand.png'
                      ),
                  ),
                ),
              )
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white10,
              child: Column(
                children: [
                 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _formulario(context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Column _formulario(context) {

//esto sirve para darle un id o bindear el control textFormField y posteriormente llamarlo para obtener sus datos .
  final TextEditingController _txtUser = TextEditingController(); 
  final TextEditingController _txtPass = TextEditingController();

  //lamamos a una instancia de logiModel para logearnos 
  var Mlogin = loginModel();

  return Column(
    children: [

      //text form field para el usuario
      DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white30, 
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
             controller: _txtUser,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 10,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Usuario',
                focusColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
                prefixIcon: Visibility(
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
              )),
        ), // Tu widget
      ),

      SizedBox(height: 15,),
      //text form field para el clave
      DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white30, 
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              controller: _txtPass,
              obscureText: true,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Clave',
                focusColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
                prefixIcon: Visibility(
                  child: Icon(
                    Icons.key,
                    color: Colors.grey,
                  ),
                ),
              )),
        ), // Tu widget
      ),
      SizedBox(height: 15,),
      //boton
      
      ElevatedButton(
        
        onPressed: () async {

              
                Mlogin.userName = _txtUser.text.trim();
                Mlogin.password = _txtPass.text.trim();
                var isLoggedIn = await Mlogin.fn_login();
                if (isLoggedIn) {
                  // handle successful login
                          final snackBar = SnackBar(
                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'Bienvenid@',
                            message:
                                Mlogin.msgApi,
                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                            contentType: ContentType.success,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);

                          //me desplazo a la pantalla inicial del usuario
                          Navigator.pushNamed(context, '/Inicio');
                  //fin if
                } else {
                  // handle login failure
                 //los usuarios o clave son incorrectos y la api retorna falso , debido a que no coinciden 
                  final snackBar = SnackBar(
                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'Hubo un error.',
                            message:
                                Mlogin.msgApi,
                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                            contentType: ContentType.failure,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                  //fin else
                }
                //fin accion de boton
                
              },
        style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all<Color>(Color.fromARGB(255, 87, 0, 82))
        ),
        child: Container(
          width: 300,
          child: Text('Ingresar',textAlign: TextAlign.center,),
        ),
      )
    ],
  );
}

