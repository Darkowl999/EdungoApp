import 'package:flutter/material.dart';

class Myvalidpage3 extends StatefulWidget {
  @override
  _Myvalidpage3State createState() => _Myvalidpage3State();
}

class _Myvalidpage3State extends State<Myvalidpage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("solicitud para ser educador"),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: AlertDialog(
          title: Text('Gracias por querer formar parte de nuestro equipo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Estamos procesando su solicitud'),
                Text('Aguarde a que le confirmemos'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Volver'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      )
      ),
    );
  }
}
