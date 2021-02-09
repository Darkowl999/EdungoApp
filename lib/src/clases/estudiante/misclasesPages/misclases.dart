//TODO: ESTAS CLASE ES PARA QUE EL ESTUDIANTE VEA SUS CLASES PENDIENTES:

import 'package:edungofrontfinal/src/clases/estudiante/misclasesPages/detalles%20de%20la%20clase.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class misClases extends StatefulWidget {
  @override
  _misClasesState createState() => _misClasesState();
}

class _misClasesState extends State<misClases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Mis clases"),
      ),
      body: Container(
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
               Row(
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "Tus clases pendientes",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
    
              SizedBox(
                height: 50,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //este navigator es para la ruta//
                        builder: (context) => detallesClase(),
                      ),
                    );
                  },
                  child: GFCard(
                    elevation: 5,
                    boxFit: BoxFit.cover,
                    image: Image.asset(
                      "assets/logo.png",
                      height: 90,
                      width: 100,
                    ),
                    title: GFListTile(
                      title: Text('Titulo de la clase'),
                      // icon:
                    ),
                    content:
                        Text("Some quick example text to build on the card"),
                    buttonBar: GFButtonBar(
                      children: <Widget>[
                        Column(
                          children: [
                            SizedBox(
                              child: TextField(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GFButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    //este navigator es para la ruta//
                                    builder: (context) => detallesClase(),
                                  ),
                                );
                              },
                              text: 'Ver detalles de la clase',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
