import 'package:edungofrontfinal/src/clases/estudiante/Materias_Page.dart';
import 'package:edungofrontfinal/src/clases/estudiante/auxiliaresPage.dart';
import 'package:flutter/material.dart';
import 'package:edungofrontfinal/src/widgets/carrusel.dart';
import 'package:getwidget/getwidget.dart';

import 'categoryRepository.dart';

// ignore: must_be_immutable
class MateriasPage extends StatefulWidget {
  @override
  String id_area;
  MateriasPage(this.id_area);

  MateriasPageState createState() {
    return MateriasPageState(id_area);
  }
}

class MateriasPageState extends State<MateriasPage> {

  // ignore: non_constant_identifier_names
  String id_area;
  MateriasPageState(this.id_area);
  var repository = new CategoryRepository();
  List<Widget> materiasList = new List<Widget>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMaterias();
  }

  loadMaterias() async {
    List result = await repository.loadMaterias(id_area);
    setState(() {
      result.forEach((item) {
        var c = cartaejemplo(item['nombre'], item['id']);
        materiasList.add(c);
        materiasList.add(SizedBox(
          height: 20,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materias",style: TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: ListView(
                children: <Widget>[
                  carrusel(context),
                  GFListTile(
                    color: Colors.blueGrey,
                    title: Center(
                        child: Text(
                          "Materias del Area",
                          style: TextStyle(fontSize: 20, color: Colors.white,fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),
                        )),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                      child: Column(
                          children: <Widget>[
                            Container(
                              padding : EdgeInsets.symmetric(horizontal: 20.0),
                              child: (materiasList.length == 0)? const Center(child: const CircularProgressIndicator()): listOfMaterias(),
                            )
                          ]
                      )
                  ),

                ],
              ),
            ),
          )),
    );
  }

  Widget listOfMaterias() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: materiasList.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index) {
          return materiasList[index];
        });
  }

  //widgets que son una weba de largos//
// ignore: missing_return
  Widget cartaejemplo(String nombre,int id) {
    return InkWell(
      child: GFListTile(titleText: nombre, icon: Icon(Icons.arrow_forward_ios)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            //este navigator es para la ruta//
            builder: (context) => PagesAuxiliar(id.toString(),nombre),
          ),
        );
      },
    );
  }


}
