import 'package:edungofrontfinal/src/clases/estudiante/Materias_Page.dart';
import 'package:edungofrontfinal/src/clases/estudiante/auxiliaresPage.dart';
import 'package:edungofrontfinal/src/widgets/carrusel.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'categoryRepository.dart';

// ignore: must_be_immutable
class AreasPage extends StatefulWidget {
  @override
  String id_categoria;
  AreasPage(this.id_categoria);

  AreasPageState createState() {
    return AreasPageState(id_categoria);
  }
}

class AreasPageState extends State<AreasPage> {
 
  // ignore: non_constant_identifier_names
  String id_categoria;
  AreasPageState(this.id_categoria);
  var repository = new CategoryRepository();
  List<Widget> areaList = new List<Widget>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAreas();
  }

  loadAreas() async {
    List result = await repository.loadAreas(id_categoria);
    setState(() {
      result.forEach((item) {
        var c = cartaejemplo(item['nombre'], item['id']);
        areaList.add(c);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Areas de estudio",style: TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Center(
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
                            "Areas de la Categoria",
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
                                child: (areaList.length == 0)? const Center(child: const CircularProgressIndicator()): listOfAreas(),
                              )
                            ]
                        )
                    ),

                  ],
                ),
              ),
            )
        ),
      )
    );
  }

  Widget listOfAreas() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: areaList.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index) {
          return areaList[index];
        });
  }

  //widgets que son una weba de largos//
// ignore: missing_return
  Widget cartaejemplo(String nombre, int id) {
    return InkWell(
      child: GFListTile(titleText: nombre, icon: Icon(Icons.arrow_forward_ios)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            //este navigator es para la ruta//
            builder: (context) => MateriasPage(id.toString()),
          ),
        );
      },
    );
  }


}
