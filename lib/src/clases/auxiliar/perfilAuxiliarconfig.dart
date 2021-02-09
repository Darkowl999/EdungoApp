import 'package:edungofrontfinal/src/clases/general/cambiarContraAux.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
class miperfilauxi extends StatelessWidget {
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
                  avatar:GFAvatar(),
                  titleText:'Auxiliar nombre',
                  subtitleText:'mishuevosensalumuera@gmail.com',
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          child: GFListTile(
                            titleText:'NOMBRES',
                            subtitleText:'Los nombres del imbecil usuario',

                          ),
                        ),
                        InkWell(
                          child: GFListTile(
                            titleText:'APELLIDOS',
                            subtitleText:'Los apellidos del mismo usuario imbecil',

                          ),
                        ),
                        GFListTile(
                          titleText:'AJUSTES',
                        ),
                        InkWell(
                          child: GFListTile(
                              titleText:'CONFIGURACIONES',
                              icon: Icon(Icons.arrow_forward_ios)
                          ),
                        ),
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
                                builder: (context) => cambiarcontrasenaAux(),
                              ),
                            );
                          },
                        ),
                        InkWell(
                          child: GFListTile(
                              titleText:'CERRAR SESION',
                              icon: Icon(Icons.exit_to_app,color: Colors.red,)
                          ),

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