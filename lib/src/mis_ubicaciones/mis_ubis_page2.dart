import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class mis_Ubic_page2 extends StatefulWidget {
  @override
  _mis_Ubic_page2State createState() => _mis_Ubic_page2State();
}

class _mis_Ubic_page2State extends State<mis_Ubic_page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Material(
              child: Image.asset("assets/estudiantes.png", fit: BoxFit.cover),

            ),
            Material(
              color: Colors.black87,
              child: ListTile(

                title: Text("DETALLES",style: TextStyle(color:Colors.white),),
                leading:GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.view_headline,
                      color: Colors.blueGrey,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 20,),
            Material(
              child: TextField(),
            ),
            Divider(),
            SizedBox(height: 20,),
            Material(
              child: TextField(),
            ),
            Divider(height: 20,color: Colors.blueGrey,),
            SizedBox(height: 30,),
            Material(
              child: Material(
                elevation: 5,
                color:Colors.black26,
                child: Container(
                    child:SizedBox(
                      height: 60,
                      child: MaterialButton(
                        child: Text("Guardar",style: TextStyle(color: Colors.white),),
                        color: Colors.blueAccent,
                        disabledColor: Colors.blueAccent,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //este navigator es para la ruta//
                                builder: (context) => mis_Ubic_page2()
                            ),
                          );
                        },
                      ),
                    )
                ),
              ),
            )

          ],
        ),

      ),
    );
  }
}
