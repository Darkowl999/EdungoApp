import 'dart:convert';

import 'package:edungofrontfinal/src/clases/general/elegirPerfil.dart';
import 'package:edungofrontfinal/src/widgets/loadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:http/http.dart' as http;

class Terminos extends StatefulWidget {
  @override
  TerminosState createState() {
    return TerminosState();
  }
}

class TerminosState extends State<Terminos> {
  String terminos = "";
  http.Response respuestaTerminos;

  @override
  initState() {
    super.initState();
    terminosRequest();
  }

  terminosRequest() async {
    final http.Response response = await http.post(
        'https://edungobolivia.com/api/configuraciones',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      const JsonDecoder decoder = const JsonDecoder();
      var item = decoder.convert(response.body);
      print(response.body);
      terminos = item[0]['terminos_condiciones'];
    }
    setState(() {
      respuestaTerminos = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                padding : EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                color: Colors.white,
                child: Column(
                  children: [
                    Text("TÉRMINOS Y CONDICIONES", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                    SizedBox(height: 20),
                    Text(terminos, textAlign: TextAlign.justify,),
                    SizedBox(height: 20),
                    GFButton(
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Elegir_Perfiles(),
                          ),
                        );
                      },
                      text: "Acepto",
                      color: Colors.green,
                      fullWidthButton: true,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
