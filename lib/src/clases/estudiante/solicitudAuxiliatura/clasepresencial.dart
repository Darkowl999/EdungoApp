//POR TEMAS DE COVID ESTA MODALIDAD NO ESTARÁ HABILITADA AUN//

import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';

class clasePresencial extends StatefulWidget {
  @override
  _clasePresencialState createState() => _clasePresencialState();
}

class _clasePresencialState extends State<clasePresencial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Lo sentimos"), backgroundColor: Colors.green),
        body: Container(
          child: SafeArea(
              child: Center(
            child: AlertDialog(
              title: Text('Por temas de bioseguridad'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Las clases presnciales'),
                    Text("no estan habilitadas"),
                  ],
                ),
              ),
              actions: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: GFButton(
                        color: Colors.deepPurple,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        text: "Aceptar",
                        shape: GFButtonShape.standard,
                        type: GFButtonType.solid,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
          )),
        ));
  }
}
