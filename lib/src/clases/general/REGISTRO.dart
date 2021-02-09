import 'package:flutter/material.dart';

class RegistroUser extends StatefulWidget {
  @override
  _RegistroUserState createState() => _RegistroUserState();
}

class _RegistroUserState extends State<RegistroUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de usuario"),
        backgroundColor: Colors.green,
      ),
      body:Container(
        
      ),
    );
  }
}

//clase formulario personalizado

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: ListView(
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
          SizedBox(height: 40,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
      
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "APELLIDOS"),
                validator: (value){
                  if(value.isEmpty){
                    return "Los apellidos son obligatorios";
                  }
                }
            ),
          ),
          SizedBox(height: 40,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
      
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "NOMBRE DE USUARIssss"),
                validator: (value){
                  if(value.isEmpty){
                    return 'El nombre de usuario es obligatorio';
                  }
                }
            ),
          ),

          SizedBox(height: 40,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
      
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "TÉLEFONO"),
                validator: (value){
                  if(value.isEmpty){
                    return 'El valor del telefono debe ser numerico';
                  }
                }
            ),
          ),
          SizedBox(height: 40,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
      
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "CORREO ELÉTRONICO"),
                validator: (value){
                  if(value.isEmpty){
                    return 'el email es un campo obligatorio';
                  }
                }
            ),
          ),
          SizedBox(height: 40,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
      
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Direccion"),
                validator: (value){
                  if(value.isEmpty){
                    return 'Debe ingresar una direccion válida';
                  }
                }
            ),
          ),
          SizedBox(height: 40,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
      
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "CONTRASEÑA"),
                validator: (value){
                  if(value.isEmpty){
                    return 'Debe ingresar una constraseña';
                  }
                }
            ),
          ),

          SizedBox(height: 40,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
      
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "CONFIRMAR CONTRASEÑA"),
                validator: (value){
                  if(value.isEmpty){
                    return 'Debe confirmar su contraseña';
                  }
                }
            ),
          ),

          //aca deberia haber la fechad de nacimiento del usuario 

        ],
      ),
    );
  }
}




