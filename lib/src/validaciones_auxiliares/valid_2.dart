import 'dart:convert';

import 'package:edungofrontfinal/src/session/session.dart';
import 'package:edungofrontfinal/src/validaciones_auxiliares/valid_3.dart';
import 'package:edungofrontfinal/src/widgets/loadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;



class validacion2Aux extends StatefulWidget {
  @override
  _validacion2AuxState createState() {
    return _validacion2AuxState();
  }
}

class _validacion2AuxState extends State<validacion2Aux> {
  PickedFile pickedFilePerfil;
  PickedFile pickedFileCI;
  PickedFile pickedFileCI2;
  final controllerCI = TextEditingController();
  String ci="";
  http.Response responseValidacion;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    controllerCI.addListener(() {
      ci=controllerCI.text;
    });
    return Scafold(context);
  }


  Widget Scafold(BuildContext context){
      return Scaffold(
        appBar: appBar(context),
        body: SafeArea(
            child: Container(
              child: todo(context)
            ),
          ),
      );
  }

  Widget todo(BuildContext context){
    return ListView(
      children: [
        espacio(10.0),
        Column(
          children: [
            imagenPerfil(context),
            mensajePerfil(context),
            espacio(20),
            inputCi(context),
            espacio(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                imagenCIA(context),
                imagenCIB(context),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mensajeCI(context,"Foto CI lado A"),
                Container(width: 50),
                mensajeCI(context,"Foto CI lado B")
              ],
            ),
            espacio(10),
            boton(context)
          ],
        ),
      ]
    );
  }



  //----------------------------------WIDGETS------------------------------//
  Widget appBar(BuildContext context){
    return AppBar(
     title: Text("Enviar datos personales"),
    backgroundColor: Colors.green
    );
  }

  Widget espacio(double size){
    return SizedBox(
      height: size,
    );
  }

  Widget imagenPerfil(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(100.0),
        elevation: 4,
        child: InkWell(
          onTap: () async {
            final picker = ImagePicker();
            pickedFilePerfil = await picker.getImage(source: ImageSource.gallery);
            setState(() {

            });
          },
          child: (pickedFilePerfil == null)
              ? GFAvatar(
            //radius: 100.0,
            backgroundImage: NetworkImage(
                "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"
            ),
            size: 100,
          )
              : GFAvatar(
            size: 100.0,
            backgroundImage: AssetImage(pickedFilePerfil.path) ,
            //shape: GFAvatarShape.standard,
          ),
        ),
      ),
    );
  }

  Widget mensajePerfil(BuildContext context){
    return Material(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            espacio(10),
            Text("Foto de perfil",textAlign: TextAlign.center,
              style: TextStyle( fontWeight: FontWeight.bold, fontSize:20),
            ),
            Text("Usa una foto nueva o una existente de tu galeria",textAlign: TextAlign.center,
              style: TextStyle(fontSize:15),
            ),
            espacio(10),
          ],
        )
    );
  }

  Widget mensajeCI(BuildContext context,String mensaje){
    return Material(
        elevation: 3,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(mensaje,textAlign: TextAlign.center,
                style: TextStyle(fontSize:15),
              ),
            )
          ],
        )
    );
  }

  Widget inputCi(BuildContext context){
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "INGRESA TU NUMERO DE CI"
      ),
      controller: controllerCI,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: (value){
        if (value.isEmpty){
          return 'El numero de CI es un campo requerido';
        }
        return null;
      },
    );
  }

  Widget imagenCIA(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(100.0),
        elevation: 4,
        child: InkWell(
          onTap: () async {
            final picker = ImagePicker();
            pickedFileCI = await picker.getImage(source: ImageSource.gallery);
            setState(() {

            });
          },
          child: (pickedFileCI == null)
              ? GFAvatar(
            //radius: 100.0,
            backgroundImage: NetworkImage(
                "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"
            ),
            size: 100,
          )
              : GFAvatar(
            size: 100.0,
            backgroundImage: AssetImage(pickedFileCI.path) ,
            //shape: GFAvatarShape.standard,
          ),
        ),
      ),
    );
  }

  Widget imagenCIB(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(100.0),
        elevation: 4,
        child: InkWell(
          onTap: () async {
            final picker = ImagePicker();
            pickedFileCI2 = await picker.getImage(source: ImageSource.gallery);
            setState(() {

            });
          },
          child: (pickedFileCI2 == null)
              ? GFAvatar(
            //radius: 100.0,
            backgroundImage: NetworkImage(
                "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"
            ),
            size: 100,
          )
              : GFAvatar(
            size: 100.0,
            backgroundImage: AssetImage(pickedFileCI2.path) ,
            //shape: GFAvatarShape.standard,
          ),
        ),
      ),
    );
  }


  Widget boton(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 50,
          child: GFButton(
            color: Colors.deepPurple,
            onPressed: () async{
              loadingDialog(context);
              await validacionRequest();
              print(responseValidacion.statusCode);
              if (responseValidacion.statusCode == 200) {
                popDialog(context);
                popDialog(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Myvalidpage3()
                  ),
                );

              }else {
                popDialog(context);
                errorDialog(context, responseValidacion);
              }
            },
            text: "Enviar datos",
            blockButton: true,
          ),
        )
      ],
    );
  }

  Future<http.Response> validacionRequest() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://edungobolivia.com/api/registrarAuxiliar'));
    bool validado=true;
    bool popUpeado=false;

    if (pickedFilePerfil!=null){
      request.files.add(await http.MultipartFile.fromPath('foto_perfil', pickedFilePerfil.path));
    }else{
      popUpeado=true;
      popDialog(context);
      errorDialogString(context, "Tiene que seleccionar una foto de perfil primero.");
      validado=false;
    }

    if (pickedFileCI!=null){
      request.files.add(await http.MultipartFile.fromPath('foto_carnet', pickedFileCI.path));
    }else{
      if (!popUpeado){ popUpeado=true; popDialog(context);}
      errorDialogString(context, "Tiene que seleccionar una foto de carnet lado A.");
      validado=false;
    }

    if (pickedFileCI2!=null){
      request.files.add(await http.MultipartFile.fromPath('foto_carnet2', pickedFileCI2.path));
    }else{
      if (!popUpeado){ popUpeado=true; popDialog(context);}
      errorDialogString(context, "Tiene que seleccionar una foto de carnet lado B.");
      validado=false;
    }

    if (ci==""){
      if (!popUpeado){ popUpeado=true; popDialog(context);}
      errorDialogString(context, "Tiene que introdicir su numero de carnet.");
      validado=false;
    }

    request.fields['id_persona'] = Session.shared.id;
    request.fields['ci']= ci;

    if (validado) {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        //String body = await response.stream.bytesToString();
        //const JsonDecoder decoder = const JsonDecoder();
        //var item = decoder.convert(body);
        //aqui se pueden usar los items del response
      }

      setState(() {
        responseValidacion = response;
      });
    }
  }

}