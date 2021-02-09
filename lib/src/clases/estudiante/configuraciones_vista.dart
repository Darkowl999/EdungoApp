import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class miperfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CONFIGURACIONES"),
        backgroundColor: Colors.black87,
      ),
      body: SafeArea (
        child: Center(
          child: Container(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20,),
                GFListTile(
                    color: Colors.black87,
                    avatar:GFAvatar(),
                    titleText:'Title',
                    subtitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                    icon: Icon(Icons.favorite)
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          child: GFListTile(
                              titleText:'NUMERO DE CELULAR',
                              subtitleText:'+5914242141',
                              icon: Icon(Icons.arrow_forward_ios)
                          ),
                        ),
                        GFListTile(
                          titleText:'RECIBIR EN TU EMAIL',
                        ),
                        InkWell(
                          child: GFListTile(

                              icon: Icon(Icons.dehaze)
                          ),
                        ),
                        InkWell(
                          child: GFListTile(
                              titleText:'CAMBIAR CONTRASEÑA',
                              icon: Icon(Icons.dehaze)
                          ),
                          /*onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //este navigator es para la ruta//
                            builder: (context) => miperfil(),
                          ),
                        );
                      },*/
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
