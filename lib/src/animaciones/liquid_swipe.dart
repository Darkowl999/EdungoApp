import 'dart:convert';

import 'package:edungofrontfinal/src/clases/auxiliar/home_auxiliar.dart';
import 'package:edungofrontfinal/src/session/session.dart';
import 'package:edungofrontfinal/src/validaciones_auxiliares/valid_3.dart';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../clases/estudiante/perfiles_estudiantes.dart';
import '../validaciones_auxiliares/valid_1.dart';

import 'package:edungofrontfinal/src/widgets/loadingDialog.dart';

import 'package:http/http.dart' as http;


final estiloTexto = TextStyle(fontSize: 20, color: Colors.white);

liquidPages(BuildContext context) {
  final liquidPages = [
    Container(
      color: Colors.deepPurpleAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 500,
                  height: 200,
                  child:GFButton(
                    elevation: 5,
                    disabledColor: Colors.green,
                    color: Colors.green,
                    onPressed: () {
                        
                    },
                    text: "Elige tu perfil",
                    textStyle: TextStyle(
                        fontSize: 30.0,
                        fontWeight:FontWeight.bold,fontStyle:FontStyle.italic
                    ),
                    fullWidthButton: true,
                    shape: GFButtonShape.pills,
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    ),



    Container(
      color: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Perfil de Estudiante",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/estudiantes.png", fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 500,
                  height: 70,
                  child:GFButton(
                    elevation: 5,
                    disabledColor: Colors.green,
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //este navigator es para la ruta//
                          builder: (context) => perfiles_estudiantes(),
                        ),
                      );
                    },
                    text: "Ingresar",
                    textStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight:FontWeight.bold,fontStyle:FontStyle.italic
                    ),
                    fullWidthButton: true,
                    shape: GFButtonShape.pills,
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  "Perfil de educador",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/auxiliar.png", fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 500,
                  height: 70,
                  child: GFButton(
                    elevation: 5,
                    disabledColor: Colors.deepPurple,
                    color: Colors.deepPurple,
                    onPressed: () async{

                      bool recepcionado=false;
                      bool habilitado=false;
                      bool datosEnviados=false;

                       loadingDialog(context);
                        final http.Response response = await http.post(
                          'https://edungobolivia.com/api/perfilAuxiliar',
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: jsonEncode(<String, dynamic>{
                            'id_persona': Session.shared.id,
                          }),
                        );

                        popDialog(context);
                        if (response.statusCode == 200) {
                          datosEnviados=true;
                          print(response.body);
                          const JsonDecoder decoder = const JsonDecoder();
                          var item = decoder.convert(response.body);
                          recepcionado=(item['recepcionado']=="1");
                          habilitado=(item['habilitado']=="1");

                        }else{
                          //errorDialog(context, response);
                        }


                      if (!datosEnviados){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //este navigator es para la ruta//
                              builder: (context) => Valid1(),
                              //builder: (context) => tabshome(),
                            ),
                          );
                      }else{
                        if (recepcionado){
                          if (habilitado){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                //este navigator es para la ruta//
                                builder: (context) => tabshome(),
                                //builder: (context) => tabshome(),
                              ),
                            );
                          }else{
                            //pantalla no ha sido aceptado vuelva a enviar sus datos
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                //este navigator es para la ruta//
                                builder: (context) => Valid1(),
                                //builder: (context) => tabshome(),
                              ),
                            );
                          }
                        }else{
                         //tendra que esperar pantalla
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //este navigator es para la ruta//
                              builder: (context) => Myvalidpage3(),
                              //builder: (context) => tabshome(),
                            ),
                          );
                        }
                      }
                    },
                    text: "Ingresar",
                    textStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight:FontWeight.bold,fontStyle:FontStyle.italic
                    ),
                    fullWidthButton: true,
                    shape: GFButtonShape.pills,
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    )

  ];
  return liquidPages;
}
