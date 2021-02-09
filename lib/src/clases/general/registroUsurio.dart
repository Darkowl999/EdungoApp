import 'dart:convert';

/*****import 'package:edungofrontfinal/src/clases/general/elegirPerfil.dart';
import 'package:edungofrontfinal/src/clases/estudiante/perfiles_estudiantes.dart';
import 'package:edungofrontfinal/src/session/session.dart';
import 'package:edungofrontfinal/src/widgets/loadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
import 'terminosYCondiciones.dart';
import 'package:intl/intl.dart';

class Registro extends StatefulWidget {
  @override
  RegistroState createState() {
    return RegistroState();
  }
}

class RegistroState extends State<Registro> {
  http.Response respuestaRegistro;
  bool autoValidate = true;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _specifyTextFieldKey =
      GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return scafold(context);
  }

  Future<http.Response> signUpRequest() async {
    final http.Response response = await http.post(
      'https://edungobolivia.com/api/registrarPersona',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': _fbKey.currentState.value['nombre'],
        'nombre_usuario': _fbKey.currentState.value['nombre_usuario'],
        'apellido': _fbKey.currentState.value['apellido'],
        'email': _fbKey.currentState.value['email'],
        'direccion': _fbKey.currentState.value['direccion'],
        'telefono': _fbKey.currentState.value['telefono'],
        'password': _fbKey.currentState.value['password'],
        'confirm_password': _fbKey.currentState.value['confirm_password'],
        'fecha_nacimiento':
            _fbKey.currentState.value['fecha_nacimiento'].toString(),
        'sexo': _fbKey.currentState.value['sexo'],
      }),
    );
    return response;
    //    print(response.body);
    //    if (response.statusCode == 200) {
    //      const JsonDecoder decoder = const JsonDecoder();
    //      var item = decoder.convert(response.body);
    //      Session.setSession(
    //          item['id'].toString(),
    //          item['nombre'],
    //          item['apellido'],
    //          item['nombre_usuario'],
    //          item['telefono'],
    //          item['sexo'],
    //          item['email'],
    //          item['direccion']);
    //    }
    //    setState(() {
    //      respuestaRegistro = response;
    //    });
  }

  Widget scafold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 12,
        title: Text("Registro de Usuario"),
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: ListView(children: <Widget>[
                FormBuilder(
                    // context,
                    key: _fbKey,
                    autovalidate: false,
                    readOnly: false,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 15),
                        FormBuilderTextField(
                          attribute: "nombre",
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "NOMBRES"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "El nombre es un campo requerido."),
                          ],
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 15),
                        FormBuilderTextField(
                          attribute: "apellido",
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "APELLIDOS"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "Los apellidos son obligatorios"),
                          ],
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 15),
                        FormBuilderTextField(
                          attribute: "nombre_usuario",
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "NOMBRE DE USUARIO"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText:
                                    "El nombre de usuario es obligatorio"),
                          ],
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 15),
                        FormBuilderTextField(
                          attribute: "telefono",
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "TÉLEFONO"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText:
                                    "El numero de telefono es requerido"),
                            FormBuilderValidators.numeric(
                                errorText:
                                    "El valor del telefono debe ser numerico"),
                          ],
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 15),
                        FormBuilderTextField(
                          attribute: "email",
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "CORREO ELÉCTRONICO"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "El campo Email es requerido"),
                            FormBuilderValidators.email(
                                errorText: "El email no es valido")
                          ],
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 15),
                        FormBuilderTextField(
                          attribute: "direccion",
                          maxLines: 4,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "DIRECCION"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText:
                                    "debe ingresar una direccion válida"),
                          ],
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 15),
                        FormBuilderTextField(
                          maxLines: 1,
                          obscureText: true,
                          attribute: "password",
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "CONTRASEÑA"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "Debe ingrear una contraseña"),
                          ],
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 15),
                        FormBuilderTextField(
                          maxLines: 1,
                          obscureText: true,
                          attribute: "confirm_password",
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "CONFIRMAR CONTRASEÑA"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "Debe confirmar su contraseña"),
                          ],
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 15),
                        FormBuilderDateTimePicker(
                          attribute: "fecha_nacimiento",
                          inputType: InputType.date,
                          //format: DateFormat("yyyy-MM-dd"),//revisar esto hay un error
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "FECHA DE NACIMIENTO"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText:
                                    "debe ingresar su fecha de nacimiento"),
                          ],
                        ),
                        SizedBox(height: 35),
                        FormBuilderRadio(
                          initialValue: "M",
                          decoration:
                              InputDecoration(labelText: 'Seleccione el Sexo'),
                          attribute: "sexo",
                          options: [
                            FormBuilderFieldOption(
                              value: "M",
                              child: Text('Masculino'),
                            ),
                            FormBuilderFieldOption(
                              value: "F",
                              child: Text('Femenino'),
                            ),
                          ],
                        ),
                        SizedBox(height: 35),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: MaterialButton(
                                disabledColor: Colors.purple,
                                focusColor: Colors.purple,
                                height: 50,
                                color: Theme.of(context).accentColor,
                                child: Text(
                                  "CONFIRMAR",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (_fbKey.currentState.saveAndValidate()) {
                                    print(_fbKey.currentState.value);
                                    loadingDialog(context);
                                    respuestaRegistro = await signUpRequest();
                                    Navigator.pop(context);
                                    if (respuestaRegistro.statusCode == 200) {
                                      if (respuestaRegistro.statusCode == 200) {
                                        const JsonDecoder decoder =
                                            const JsonDecoder();
                                        var item = decoder
                                            .convert(respuestaRegistro.body);
                                        Session.setSession(
                                          item['id'].toString(),
                                          item['nombre'],
                                          item['apellido'],
                                          item['nombre_usuario'],
                                          item['telefono'],
                                          item['sexo'],
                                          item['email'],
                                          item['direccion'],
                                          item['foto_perfil'],
                                        );
                                      }
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Terminos(),
                                        ),
                                      );
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                title: Text(
                                                  "Error",
                                                  textAlign: TextAlign.center,
                                                ),
                                                content: Container(
                                                  height: 80,
                                                  width: 80,
                                                  child: Center(
                                                      child: Text(
                                                    respuestaRegistro.body,
                                                    textAlign: TextAlign.center,
                                                  )),
                                                ));
                                          });
                                    }
                                  } else {
                                    print(_fbKey.currentState.value);
                                    print("validation failed");
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ))
              ]))),
    );
  }
}
*****/