import 'dart:convert';

import 'package:edungofrontfinal/src/validaciones_auxiliares/valid_3.dart';
import 'package:edungofrontfinal/src/session/session.dart';
import 'package:edungofrontfinal/src/widgets/loadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'valid_3.dart';

//para las imagenes en cache
import 'dart:io';
//import 'package:path/path.dart';

class validacion2Aux extends StatefulWidget {
  @override
  _validacion2AuxState createState() => _validacion2AuxState();
}

class _validacion2AuxState extends State<validacion2Aux> {

  PickedFile pickedFilePerfil;
  PickedFile pickedFileCI;
  PickedFile pickedFileCI2;
  final controllerCI = TextEditingController();
  String ci="";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    controllerCI.addListener(() {
      ci=controllerCI.text;
    });


    return Scaffold(
        appBar: AppBar(
          title: Text("validacion 2"),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
          child: Container(
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  Material(
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
                              radius: 100.0,
                              backgroundImage: NetworkImage(
                                  "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"),
                      )
                          : GFAvatar(
                              radius: 100.0,
                              backgroundImage: AssetImage(pickedFilePerfil.path) ,
                              shape: GFAvatarShape.standard,
                            ),
                    ),
                  ),
                ],
              ),
              Material(
                elevation: 3,
                child: GFListTile(
                  titleText: '                        Foto de perfil',
                  subtitleText:
                      'Usa una foto nueva o una existente de tu galeria',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "INGRESA TU NUMERO DE CI"),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Material(
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
                              radius: 40.0,
                              backgroundImage: NetworkImage(
                                  "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"),
                            )
                          : GFAvatar(
                              radius: 80.0,
                              backgroundImage: AssetImage(pickedFileCI.path) ,
                              shape: GFAvatarShape.standard,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Material(
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
                              radius: 40.0,
                              backgroundImage: NetworkImage(
                                  "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"),
                            )
                          : GFAvatar(
                              radius: 80.0,
                              backgroundImage: AssetImage(pickedFileCI2.path) ,
                              shape: GFAvatarShape.standard,
                            ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Material(
                    elevation: 1.0,
                    child: Text("Foto CI lado A"),
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Material(
                    elevation: 1.0,
                    child: Text("Foto CI lado B"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              boton(context),
            ],
          )),
        ));
  }

  void cambiar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    loadingDialog(context);
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://edungobolivia.com/api/cambiarFotoPerfil'));
    request.files
        .add(await http.MultipartFile.fromPath('foto_perfil', pickedFile.path));
    request.fields['id'] = Session.shared.id;
    var res = await request.send();
    String body = await res.stream.bytesToString();
    const JsonDecoder decoder = const JsonDecoder();
    var item = decoder.convert(body);
    Session.shared.foto = item['foto_perfil'];
    popDialog(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        //este navigator es para la ruta//
        builder: (context) => null,
      ),
    );
  }

  Widget boton(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: GFButton(
        color: Colors.deepPurple,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              //este navigator es para la ruta//
                builder: (context) =>Myvalidpage3() ),
          );
        },
        text: "Enviar datos",
        blockButton: true,
      ),
    );
  }




}
