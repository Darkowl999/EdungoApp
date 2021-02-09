import 'package:edungofrontfinal/src/session/session.dart';
import 'package:edungofrontfinal/src/clases/general/cambiarcontrasena.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class miperfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MI PERFIL",style: TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20,),
                GFListTile(
                  color: Colors.blueGrey,
                  title: Text("DATOS PERSONALES", style: TextStyle(color: Colors.white),),
                ),
                Container(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          child: GFListTile(
                            titleText:'Nombre Completo',
                            subtitleText: Session.shared.nombre + " " + Session.shared.apellido,

                          ),
                        ),
                        InkWell(
                          child: GFListTile(
                            titleText:'Nombre de Usuario',
                            subtitleText: Session.shared.nombre_usuario,
                          ),
                        ),
                        InkWell(
                          child: GFListTile(
                            titleText:'Email',
                            subtitleText: Session.shared.email,
                          ),
                        ),
                        InkWell(
                          child: GFListTile(
                            titleText:'Telefono',
                            subtitleText: Session.shared.telefono,
                          ),
                        ),
                        SizedBox(height: 20,),
                        GFListTile(
                          color: Colors.blueGrey,
                          title: Text("AJUSTES GENERALES", style: TextStyle(color: Colors.white),),
                        ),
                        /*InkWell(
                          child: GFListTile(
                              titleText:'CAMBIAR FOTO DE PERFIL',
                              icon: Icon(Icons.arrow_forward_ios)

                          ),
                        ),*/
                        InkWell(
                          child: GFListTile(
                              titleText:'CAMBIAR CONTRASEÑA',
                              icon: Icon(Icons.arrow_forward_ios)
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                //este navigator es para la ruta//
                                builder: (context) => cambiarContrasenaPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                )

              ],
            ),
          ),
        ),
      )
    );
  }
}
