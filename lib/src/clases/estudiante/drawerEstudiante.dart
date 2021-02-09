import 'dart:convert';
import 'package:edungofrontfinal/src/clases/estudiante/misclasesPages/misclases.dart';
import 'package:edungofrontfinal/src/mis_ubicaciones/mis_ubis_page1.dart';
import 'package:edungofrontfinal/src/session/session.dart';
import 'package:edungofrontfinal/src/clases/estudiante/miperfil.dart';
import 'package:edungofrontfinal/src/clases/estudiante/perfiles_estudiantes.dart';
import 'package:edungofrontfinal/src/validaciones_auxiliares/valid_1.dart';
import 'package:edungofrontfinal/src/widgets/loadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

Widget drawerEstudiante(BuildContext context) {
  return GFDrawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          child: GFDrawerHeader(
            decoration: BoxDecoration(color: Colors.green[400]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.getImage(source: ImageSource.gallery);
                    loadingDialog(context);
                    var request = http.MultipartRequest('POST',
                        Uri.parse('https://edungobolivia.com/api/cambiarFotoPerfil'));
                    request.files.add(await http.MultipartFile.fromPath(
                        'foto_perfil', pickedFile.path));
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
                        builder: (context) => perfiles_estudiantes(),
                      ),
                    );
                  },
                  child: (Session.shared.foto == "")
                      ? GFAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(
                              "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"),
                        )
                      : GFAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(
                              "https://edungobolivia.com/storage/" +
                                  Session.shared.foto),
                        ),
                ),
                SizedBox(height: 10),
                Text(
                  Session.shared.nombre + " " + Session.shared.apellido,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(Session.shared.email),
              ],
            ),
          ),
        ),
        SizedBox(height: 50,),
        InkWell(
          child: GFListTile(titleText: 'INICIO', icon: Icon(Icons.home)),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                //este navigator es para la ruta//
                builder: (context) => perfiles_estudiantes(),
              ),
            );
          },
        ),
        SizedBox(height: 20,),
        InkWell(
          child: GFListTile(titleText: 'MI PERFIL', icon: Icon(Icons.person)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                //este navigator es para la ruta//
                builder: (context) => miperfil(),
              ),
            );
          },
        ),
        SizedBox(height: 20,),
        InkWell(
          child: GFListTile(
              titleText: 'MIS CLASES', icon: Icon(Icons.notifications_none)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                //este navigator es para la ruta//
                builder: (context) => misClases(),
              ),
            );
          },

        ),


        InkWell(
          child: GFListTile(
              titleText: 'MIS FAVORITOS', icon: Icon(Icons.favorite)),
        ),
      /*  InkWell(
          child: GFListTile(titleText: 'MIS CUPONES', icon: Icon(Icons.casino)),
        ),*/
        InkWell(
          child: GFListTile(
              titleText: 'CERRAR SESION',
              icon: Icon(Icons.exit_to_app,color: Colors.red,)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                //este navigator es para la ruta//
                //builder: (context) => Valid1(),
              ),
            );
          },
        ),
        /*SizedBox(height: 150,),
        InkWell(
          child:GFButton(
            color: Colors.green,
            text: "EDUNGO-BOLIVIA",
            shape: GFButtonShape.square,
            type: GFButtonType.outline,
          ),
        ),*/

      ],
    ),
  );
}
