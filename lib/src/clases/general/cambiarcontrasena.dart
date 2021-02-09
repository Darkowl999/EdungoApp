import 'dart:convert';

import 'package:edungofrontfinal/src/session/session.dart';
import 'package:edungofrontfinal/src/widgets/loadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:http/http.dart' as http;

class cambiarContrasenaPage extends StatefulWidget {
  @override
  cambiarContrasenaPageState createState() {
    return cambiarContrasenaPageState();
  }
}

class cambiarContrasenaPageState extends State<cambiarContrasenaPage> {

  final controllerContrasenaActual = TextEditingController();
  final controllerContrasenaNueva = TextEditingController();
  final controllerContrasenaConfirmacion = TextEditingController();
  String c_actual = "";
  String c_nueva = "";
  String c_confirmacion = "";
  http.Response cambioContrasenaResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerContrasenaActual.addListener(() {
      c_actual = controllerContrasenaActual.text;
    });
    controllerContrasenaNueva.addListener(() {
      c_nueva = controllerContrasenaNueva.text;
    });
    controllerContrasenaConfirmacion.addListener(() {
      c_confirmacion = controllerContrasenaConfirmacion.text;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("CAMBIAR CONTRASEÑA"),
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: Container(
          padding : EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(

            child: ListView(
              children: <Widget>[
                SizedBox(height: 30),
                Text('RECUERDA QUE COMO MINIMO DEBE TENER 8 CARACTERES', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                SizedBox(height: 30),
                Text('CONTRASEÑA ACTUAL', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                SizedBox(height: 10),
                SizedBox(
                  width: 150,
                  child: TextField(
                    obscureText: true,
                    controller: controllerContrasenaActual,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Contraseña Actual",),
                  ),
                ),
                SizedBox(height: 30),
                Text('CONTRASEÑA NUEVA', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                SizedBox(height: 10),
                SizedBox(
                  width: 150,
                  child: TextField(
                    obscureText: true,
                    controller: controllerContrasenaNueva,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Contraseña Nueva"),
                  ),
                ),
                SizedBox(height: 30),
                Text('CONFIRMAR CONTRASEÑA', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                SizedBox(height: 10),
                SizedBox(
                  width: 150,
                  child: TextField(
                    obscureText: true,
                    controller: controllerContrasenaConfirmacion,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Confirme su nueva contraseña"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  child: GFButton(
                    onPressed: () async {
                      loadingDialog(context);
                      cambioContrasenaResponse = await cambioContrasena();
                      popDialog(context);
                      if(cambioContrasenaResponse!= null && cambioContrasenaResponse.statusCode == 200){
                        genericDialog(context, "Cambio Realizado!");
                        Navigator.pop(context);
                      }
                      else if(cambioContrasenaResponse!=null){
                        errorDialog(context, cambioContrasenaResponse);
                      }
                    },
                    color: Colors.green,
                    disabledColor: Colors.green,
                    text: "Guardar cambios",textStyle:TextStyle(color: Colors.white,),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<http.Response> cambioContrasena() async {
    final http.Response response = await http.post(
      'https://edungobolivia.com/api/cambiarPassword',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': Session.shared.id,
        'password': c_actual,
        'new_password': c_nueva,
        'confirm_new_password': c_confirmacion,
      }),
    );
    return response;
  }
}
