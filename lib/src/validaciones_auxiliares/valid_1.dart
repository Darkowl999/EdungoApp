import 'dart:convert';

import 'package:edungofrontfinal/src/session/session.dart';
import 'package:edungofrontfinal/src/validaciones_auxiliares/valid_2.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class Valid1 extends StatefulWidget {
  @override
  _Valid1State createState() => _Valid1State();
}

class _Valid1State extends State<Valid1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Material(
                    elevation: 2,
                    child: Image.asset("assets/logo.png", fit: BoxFit.cover),
              )),
              Divider(),
              SizedBox(
              height: 10,
            ),
              Container(
                child: Material(
              elevation: 10,
                  child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                    const ListTile(
                      title: Text('¿Quieres formar parte del equipo Edungo?'),
                      subtitle: Text('    Envíanos tus datos para registrarte'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Siguiente'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  //este navigator es para la ruta//
                                  builder: (context) => validacion2Aux()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          ],
        )),
      ),
    );
  }
}
