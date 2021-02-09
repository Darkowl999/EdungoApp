import 'package:edungofrontfinal/src/clases/auxiliar/crearGrupo/crearGrupoPag1.dart';
import 'package:edungofrontfinal/src/validaciones_auxiliares/valid_1.dart';
import 'package:edungofrontfinal/src/clases/auxiliar/home_auxiliar.dart';
import 'package:edungofrontfinal/src/clases/auxiliar/perfilAuxiliarconfig.dart';
import 'package:edungofrontfinal/src/clases/pruebita.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

Widget drawerauxiliar(BuildContext context) {
  return GFDrawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Center(
          child: GFDrawerHeader(
            decoration: BoxDecoration(
                color: Colors.green
            ),
            currentAccountPicture: Center(
              child: GFAvatar(
                radius: 100.0,
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('user name'),
                Text('user@userid.com'),
              ],
            ),
          ),
        ),
        InkWell(
          child: GFListTile(titleText: 'INICIO', icon: Icon(Icons.home)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                //este navigator es para la ruta//
                builder: (context) => tabshome(),
              ),
            );
          },
        ),
        InkWell(
          child: GFListTile(titleText: 'MI PERFIL', icon: Icon(Icons.person)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                //este navigator es para la ruta
                builder: (context) => miperfilauxi(),
              ),
            );
          },
        ),
      /*  InkWell(
          child:
          GFListTile(titleText: 'AYUDA EN LINEA', icon: Icon(Icons.map)),
        ),*/
        InkWell(
          child: GFListTile(
              titleText: 'PAGOS', icon: Icon(Icons.apps)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                //este navigator es para la ruta
                builder: (context) => pruebanga()
              ),
            );
          },
        ),
        InkWell(
          child: GFListTile(
              titleText: 'GANANCIAS', icon: Icon(Icons.monetization_on)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                //este navigator es para la ruta
                  builder: (context) => null
              ),
            );
          },
        ),
      InkWell(
          child: GFListTile(
              titleText: 'CREAR UN NUEVO GRUPO', icon: Icon(Icons.monetization_on)),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                //este navigator es para la ruta
                  builder: (context) => crearGrupoPage1()
              ),
            );
          },
        ),
         InkWell(
          child: GFListTile(
              titleText: 'CERRAR SESION',
              icon: Icon(Icons.exit_to_app,color: Colors.red,)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                //este navigator es para la ruta//
                builder: (context) => Valid1(),
              ),
            );
          },
        ),
        /*InkWell(
          child: GFListTile(titleText: 'HORARIOS', icon: Icon(Icons.casino)),
        ),*/
      ],
    ),
  );
}
