import 'dart:convert';
import 'package:edungofrontfinal/src/UI/customInputField.dart';
import 'package:edungofrontfinal/src/clases/general/elegirPerfil.dart';
import 'package:edungofrontfinal/src/session/session.dart';
import 'package:edungofrontfinal/src/widgets/loadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'botonRegistro.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();
  String email = "";
  String pass = "";
  http.Response responseLogin;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerEmail.addListener(() {
      email = controllerEmail.text;
    });
    controllerPass.addListener(() {
      pass = controllerPass.text;
    });
    return Scafold(context);
  }

  Future<http.Response> loginRequest() async {
    final http.Response response = await http.post(
      'https://edungobolivia.com/api/loginPersona',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre_usuario': email,
        'password': pass,
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
      const JsonDecoder decoder = const JsonDecoder();
      var item = decoder.convert(response.body);
      Session.setSession(
          item['id'].toString(),
          item['nombre'],
          item['apellido'],
          item['nombre_usuario'],
          item['telefono'],
          item['sexo'],
          item['email'],
          item['direccion'],
          item['foto_perfil']
      );
    }
    setState(() {
      responseLogin = response;
    });
  }

  Widget Scafold(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.green,
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: todo(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget todo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.green,
      padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          Image.asset(
            "assets/logoedungo.png",
            alignment: Alignment.center,
            height: 300,
            width: 300,
          ),
          CustomInputField(
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              "USUARIO",
              controllerEmail,
              false),
          SizedBox(
              height: 20.0), //esta es la clase customInputo de la carpeta UI
          CustomInputField(
              Icon(
                Icons.lock,
                color: Colors.white,
              ),
              "CONTRASEÑA",
              controllerPass,
              true),
          SizedBox(height: 20.0),
          botonIngresar(context),
          SizedBox(height: 20.0),
          botonRegistro(context),
        ],
      ),
    );
  }

  Widget botonIngresar(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () async {
          loadingDialog(context);
          await loginRequest();
          popDialog(context);
          (responseLogin.statusCode == 200)
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Elegir_Perfiles()
                    //aca deberia estar la bienvenida del estudiante como tal a la aplicacion
                  ),
                )
              : errorDialog(context, responseLogin);
        },
        color: Colors.deepPurple,
        disabledColor: Colors.deepPurple,
        disabledTextColor: Colors.white,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          "INGRESAR",
          style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),
        ),
      ),
    );
  }
}
