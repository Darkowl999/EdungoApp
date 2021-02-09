import 'package:edungofrontfinal/src/clases/estudiante/solicitudAuxiliatura/clasepresencial.dart';
import 'package:edungofrontfinal/src/clases/estudiante/solicitudAuxiliatura/formulario_solicitud.dart';
import 'package:edungofrontfinal/src/clases/general/RegistroUser.dart';
import 'package:edungofrontfinal/src/ubicaciones/add_ubicacion.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
class tipodeClase extends StatefulWidget {

  tipodeClase(this.id_materia,this.id_auxiliar);
  String id_materia,id_auxiliar;

  @override
  _tipodeClaseState createState() => _tipodeClaseState(id_materia,id_auxiliar);

}

class _tipodeClaseState extends State<tipodeClase> {

  _tipodeClaseState(this.id_materia,this.id_auxiliar);
  String id_materia,id_auxiliar;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipo de clase"),
        backgroundColor: Colors.green,
      ),
      body:Container(
        child: SafeArea(
          child:ListView(
            children: [
              SizedBox(height: 100,),
              Center(
                child: AlertDialog(
                  title: Text('Selecciona tu tipo de clase'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                       Text('Elige si quieres una clase'),
                        Text("virtual o presencial"),
                      ],
                    ),
                 ),
                  actions: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 50,
                          child:GFButton(
                            color: Colors.deepPurple,
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //este navigator es para la ruta//
                                  builder: (context) => AddUbicacion()//FormClass(id_materia,id_auxiliar),
                                ),
                              );
                            },
                            text: "Clase virtual",


                            type: GFButtonType.solid,
                          ),
                        ),


                        SizedBox(width: 20,),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child:GFButton(
                            color: Colors.deepPurple,
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //este navigator es para la ruta//
                                  builder: (context) => clasePresencial()
                                ),
                              );
                            },
                            text: "Clase presencial",
                            shape: GFButtonShape.standard,
                            type: GFButtonType.solid,
                          ),
                        ),
                        SizedBox(width: 40,),
                      ],
                    ),

                  ],
                ) ,
              )

            ],
          ),
        ),
      ),
    );
  }
}
