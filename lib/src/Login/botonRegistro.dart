import 'package:edungofrontfinal/src/clases/general/RegistroNuevo.dart';
import 'package:edungofrontfinal/src/clases/general/RegistroUser.dart';
import 'package:edungofrontfinal/src/clases/general/registroUsurio.dart';
import 'package:flutter/material.dart';

Widget botonRegistro(BuildContext context) {
  return Container(
    width: 300,
    height: 60,
    child: RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage4()
              ),
        );
      },
      color: Colors.blueAccent,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Text(
        "REGISTRARME",
        style: TextStyle(fontSize: 20.0),
      ),
    ),
  );
}
