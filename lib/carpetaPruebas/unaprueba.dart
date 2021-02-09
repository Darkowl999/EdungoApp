import 'package:edungofrontfinal/carpetaPruebas/datetime.dart';
import 'package:flutter/material.dart';

class UnaPrueba extends StatefulWidget {
  @override
  _UnaPruebaState createState() => _UnaPruebaState();
}

class _UnaPruebaState extends State<UnaPrueba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UNA PRUEBA MAS"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            disabledColor: Colors.deepPurple,
            color: Colors.purple,
            child: Text("Prueba",style: TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  //este navigator es para la ruta//
                  builder: (context) =>TIME2(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
