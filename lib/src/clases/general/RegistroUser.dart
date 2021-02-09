//ESTE SERA EL FORMULARIO DONDE EL ESTUDIANTE SOLICITARA SU AUXILIATURA//
import 'package:edungofrontfinal/carpetaPruebas/unaprueba.dart';
import 'package:edungofrontfinal/src/clases/general/REGISTRO.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:getwidget/types/gf_button_type.dart';

import 'RegistroNuevo.dart';
//este formulario de auxiliatura utilizaba formbuilder
class pruebanga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario de registro"),
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
                    return 'El nombre es un campo requerido';
                  }
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "APELLIDOS"),
                validator: (value){
                  if(value.isEmpty){
                    return 'Los apellidos son una campo requerido';
                  }
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "NOMBRE DE USUARIO"),
                validator: (value){
                  if(value.isEmpty){
                    return 'el nombre de usuario es un campo requerido';
                  }
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "TÉLEFONO"),
                validator: (value){
                  if(value.isEmpty){
                    return 'El télefono es un campo requerido';
                  }
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "CORREO ELÉCTRONICO"),
                validator: (value){
                  if(value.isEmpty){
                    return 'el correo eléctronico es un campo requerido';
                  }
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "DIRECCIÓN"),
                validator: (value){
                  if(value.isEmpty){
                    return 'Por favor ingrese datos';
                  }
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "CONFIRMAR CONTRASEÑA"),
                validator: (value){
                  if(value.isEmpty){
                    return 'Confirmar su contraseña es un campo requerido';
                  }
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "DIRECCIÓN"),
                validator: (value){
                  if(value.isEmpty){
                    return 'La direccion es un campo obligatorio';
                  }
                }
            ),
          ),
          SizedBox(height: 10,),

          SizedBox(
            height: 50,
            child:GFButton(
              color: Colors.black54,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //este navigator es para la ruta//
                    builder: (context) =>BasicTimeField()
                  ),
                );


              },
              text: "INSERTAR FECHA DE NACIMIENTO",
              shape: GFButtonShape.square,
              type: GFButtonType.outline,
            ),
          ),
          SizedBox(height: 10,),
          // padding: const EdgeInsets.symmetric(vertical: 10.0),child:
          SizedBox(
            width: 80,
            height: 80,
            child: GFButton(
              color: Colors.deepPurple,
              onPressed: (){
                //devolverá true si el formulario es válido, o falso si el formulario no es valido
                if(_formKey.currentState.validate()){
                  //si el formulario es valido , se mostrará un snackbar
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Procesando datos"),));

                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //este navigator es para la ruta//
                    builder: (context) =>UnaPrueba(),
                  ),
                );
              },
              child: Text("REGISTRARME",style: TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic,fontSize: 20,color: Colors.white),),
            ),
          ),
          SizedBox(height: 40,),
          Material(),

        ],
      ),
    );
  }
}
////====================================================================================================================================================///
//CLASE DATE PICKER//
