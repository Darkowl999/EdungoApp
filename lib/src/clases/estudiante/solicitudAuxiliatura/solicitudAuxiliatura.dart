import 'package:edungofrontfinal/src/clases/estudiante/solicitudAuxiliatura/formulario_solicitud.dart';
import 'package:edungofrontfinal/src/clases/general/RegistroUser.dart';
import 'package:edungofrontfinal/src/clases/estudiante/solicitudAuxiliatura/tipo_de_clase.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
class solicitudAuxiliatura extends StatelessWidget {
  //el push dirige el formulario de auxiliatura//

  solicitudAuxiliatura(this.id_materia,this.id_auxiliar,this.nombreMateria);
  String id_materia;
  String id_auxiliar;
  String nombreMateria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text("Solicitud de clases"),
           backgroundColor: Colors.green,
         ),
        body: SafeArea(
          child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                    ),
                    Center(
                      child:Material(
                        elevation: 5,
                        child: GFListTile(
                          avatar:GFAvatar(
                            shape: GFAvatarShape.standard,
                            size: 60,
                          ),
                          titleText:this.nombreMateria,
                          subTitle: Text(''),

                          description:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 40,
                                child:SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: GFButton(
                                    color: Colors.green,
                                    text: "Clase particular",

                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          //este navigator es para la ruta//
                                            builder: (context) => tipodeClase(id_materia,id_auxiliar)
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),


                              SizedBox(width: 20,),
                              SizedBox(
                                width: 100,
                                height: 40,
                                child: GFButton(
                                  color: Colors.green,
                                  text: "Clase grupal",
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        //este navigator es para la ruta//
                                          builder: (context) => FormClass(id_materia,id_auxiliar),
                                      ),
                                    );

                                  },
                                ),
                              ),

                            ],

                          ),
                        ),
                      ),

                    )
                  ],
                ),
              )
          ),
        )
    );
  }
}
