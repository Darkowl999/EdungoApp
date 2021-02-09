//TODO: Esta clase solo muestra los detalles de una clase como ser la hora, la fecha la clase como tal etc.

import 'package:flutter/material.dart';
import 'package:getwidget/components/alert/gf_alert.dart';
import 'package:getwidget/components/floating_widget/gf_floating_widget.dart';

class detallesClase extends StatefulWidget {
  @override
  _detallesClaseState createState() => _detallesClaseState();
}

class _detallesClaseState extends State<detallesClase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles de la clase"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: SafeArea(
          child: Center(
            child: AlertDialog(
              title: Text('Detalles de la clase'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Materia:'),
                    Text('Fecha:'),
                    Text('Hora inicio:'),
                    Text('Hora fin:'),
                    Text('Precio:'),
                  ],
                ),
              ),
              actions: <Widget>[
                Column(
                  children: [
                     Row(
                      children: [
                        FlatButton(
                          child: Text('Aceptar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('Aceptar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FlatButton(
                          child: Text('Aceptar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('Aceptar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
