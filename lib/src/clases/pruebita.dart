//esta clase solo sirve para pruebas nada mas //
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/alert/gf_alert.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/floating_widget/gf_floating_widget.dart';
class pruebanga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("es una prueba esta pantalla"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child:MyCustomForm() ,
      ),
    );
  }
}

//clase formulario personalizado//

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  //esto es un global key form state//
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:ListView(
        children: [
          SizedBox(height: 40,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "NOMBRES"),
                validator: (value){
                  if(value.isEmpty){
                    return 'Por favor ingrese datos';
                  }
                }
            ),
          ),
           // padding: const EdgeInsets.symmetric(vertical: 10.0),child:
      SizedBox(
              width: 80,
              height: 80,
              child: GFButton(
                onPressed: (){
                  //devolverá true si el formulario es válido, o falso si el formulario no es valido
                  if(_formKey.currentState.validate()){
                    //si el formulario es valido , se mostrará un snackbar
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Procesando datos"),));

                  }
                },
                child: Text("Registrarme",style: TextStyle(fontWeight:FontWeight.w500,),),
              ),
            ),
        ],
      ),
    );
  }
}

