import 'package:edungofrontfinal/src/clases/auxiliar/drawerAuxiliar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/shape/gf_button_shape.dart';

import '../estudiante/drawerEstudiante.dart';

class tabshome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "CLASES PENDIENTES",
                ),
                Tab(
                  text: "MIS GRUPOS",
                ),
              ],
            ),
            title: Text('Edungo Bolivia'),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                ListView(
                  children: <Widget>[cartaMaterias(context)],
                ),
                ListView(
                  children: <Widget>[cartaMaterias(context)],
                ),
              ],
            ),
          ),
          drawer: Drawer(
            // Agrega un ListView al drawer. Esto asegura que el usuario pueda desplazarse
            // a través de las opciones en el Drawer si no hay suficiente espacio vertical
            // para adaptarse a todo.
            child: drawerauxiliar(context),
          ),
        ),
      ),
    );
  }

  Widget cartaMaterias(BuildContext context) {
    return GFCard(
      elevation: 10,
      color: Colors.white,
      boxFit: BoxFit.cover,
      //image: Image.asset('your asset image'),
      title: GFListTile(
        title: Text(
          'Calculo 1',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      content: Text(
        "Calculo 1 grupo SA ",
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
      buttonBar: GFButtonBar(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          GFButton(
            elevation: 10,
            color: Colors.deepPurple,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //este navigator es para la ruta//
                  builder: (context) => DetalleCLase(context),
                ),
              );
            },
            text: 'Detalles de la clase',
            textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
            shape: GFButtonShape.standard,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget DetalleCLase(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalles de la clase"),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
          child: Center(
              child: Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: ListView(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: AlertDialog(
                      title: Text('Detalles de la clase'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('deben estar los detalles de la clase como tal'),
                            Text('aca deben estar las clases como tal'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Aceptar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        ));
  }
}
