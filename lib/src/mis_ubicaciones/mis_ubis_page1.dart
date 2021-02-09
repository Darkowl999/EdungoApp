
import 'package:edungofrontfinal/src/mis_ubicaciones/mis_ubis_page2.dart';
import 'package:flutter/material.dart';

class mis_Ubic_page1 extends StatefulWidget {
  @override
  _mis_Ubic_page1State createState() => _mis_Ubic_page1State();
}

class _mis_Ubic_page1State extends State<mis_Ubic_page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis ubicaciones"),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child:ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Material(
              color: Colors.black26,
              elevation: 4,
              child: Card(
                elevation: 4,
                child: ListTile(
                  title: Text("Ubicacion 1"),
                  leading:GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blueGrey,
                        size: 24.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                  trailing: GestureDetector(
                    child: Container(
                      child:Icon(
                        Icons.delete,
                        color: Colors.grey,
                        size: 24.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Material(
              color: Colors.black26,
              elevation: 4,
              child: Card(
                elevation: 4,
                child: ListTile(
                  title: Text("Ubicacion 2"),
                  leading:GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blueGrey,
                        size: 24.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                  trailing: GestureDetector(
                    child: Container(
                      child:Icon(
                        Icons.delete,
                        color: Colors.grey,
                        size: 24.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Material(
              color: Colors.black26,
              elevation: 4,
              child: Card(
                elevation: 4,
                child: ListTile(
                  title: Text("Ubicacion 3"),
                  leading:GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blueGrey,
                        size: 24.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                  trailing: GestureDetector(
                    child: Container(
                      child:Icon(
                        Icons.delete,
                        color: Colors.grey,
                        size: 24.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Material(
              color: Colors.black26,
              elevation: 4,
              child: Card(
                elevation: 4,
                child: ListTile(
                  title: Text("Ubicacion 4"),
                  leading:GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blueGrey,
                        size: 24.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                  trailing: GestureDetector(
                    child: Container(
                      child:Icon(
                        Icons.delete,
                        color: Colors.grey,
                        size: 24.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Material(
              color: Colors.black26,
              elevation: 4,
              child: Card(
                elevation: 4,
                child: ListTile(
                  title: Text("Ubicacion 5"),
                  leading:GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blueGrey,
                        size: 24.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                  trailing: GestureDetector(
                    child: Container(
                      child:Icon(
                        Icons.delete,
                        color: Colors.grey,
                        size: 24.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Material(
              elevation: 5,
              color:Colors.black26,
              child: Container(
                child:SizedBox(
                  height: 60,
                  child: MaterialButton(
                    child: Text("Añadir ubicacion",style: TextStyle(color: Colors.white),),
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
            )

          ],
        )
      ),
    );
  }
}
