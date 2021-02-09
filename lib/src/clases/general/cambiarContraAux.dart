import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
class cambiarcontrasenaAux extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CAMBIAR CONTRASEÑA"),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Container(
          child: Container(
            padding : EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: <Widget>[
                Center(
                  child:  GFListTile(
                    title: Text('RECUERDA QUE COMO MINIMO DEBE TENER 8 CARACTERES', textAlign: TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),),
                  ),
                ),
                InkWell(
                  child:GFListTile(
                    titleText:'CONTRASEÑA ACTUAL',
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Contraseña Actual"),
                  ),
                ),
                InkWell(
                  child:GFListTile(
                    titleText:'Nueva Contraseña',
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Contraseña Nueva"),
                  ),
                ),
                InkWell(
                  child:GFListTile(
                    titleText:'Confirme su nueva contraseña',
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Confirme su nueva contraseña",),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  child: GFButton(
                    color: Colors.deepPurple,
                    disabledColor: Colors.deepPurple,
                    text: "Guardar cambios",textStyle:TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),
                  ),
                )

              ],
            ),
          ),
      ),
      ),
    );
  }
}
