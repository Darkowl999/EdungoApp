import 'package:edungofrontfinal/src/clases/estudiante/drawerEstudiante.dart';
import 'package:edungofrontfinal/src/clases/estudiante/areas.dart';
import 'package:edungofrontfinal/src/clases/estudiante/categoryRepository.dart';
import 'package:edungofrontfinal/src/widgets/carrusel.dart';
import 'package:edungofrontfinal/src/widgets/topContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
//ESTA PANTALLA ES LA DE LOS 2 PERFILES DE LOS ESTUDIANTES// UNIVERSITARIO / COLEGIAL
//EN ESTA PANTALLA ṔOR EJEMPLO ES LA PANTALLA PRIMERA QUE SE LE MOSTRARA AL ESTUDIANTE
class perfiles_estudiantes extends StatefulWidget {
  @override
  perfiles_estudiantesState createState() {
    return perfiles_estudiantesState();
  }
}

class perfiles_estudiantesState extends State<perfiles_estudiantes> {
  var repository = new CategoryRepository();
  List<Widget> categoryList = new List<Widget>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCategories();
  }

  loadCategories() async {
    List result = await repository.loadCategories();
    setState(() {
      result.forEach((item) {
        var c = cartaejemplo(item['nombre'], item['id']);
        categoryList.add(c);
      });
    });
  }

  Widget cartaejemplo(String nombre, int id) {
    return InkWell(
      child: GFListTile(titleText: nombre, icon: Icon(Icons.arrow_forward_ios)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            //este navigator es para la ruta//
            builder: (context) => AreasPage(id.toString()),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scafold(context);
  }

  Widget listOfCategories() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: categoryList.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index) {
          return categoryList[index];
        });
  }

  Widget columna(BuildContext context) {
    //ESTA ES LA COLUMNA//
    return listOfCategories();
  }

  Widget Scafold(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Edungo Bolivia",style:TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
          child: Material(
            elevation: 5,
            child: Column(children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      carrusel(context),
                      SizedBox(
                        height: 10,
                      ),
                      GFListTile(
                        color: Colors.blueGrey,
                        title: Center(
                            child: Text(
                              "Categorias",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                      Container(
                        padding : EdgeInsets.symmetric(horizontal: 20.0),
                        child: (categoryList.length == 0)? const Center(child: const CircularProgressIndicator()): columna(context),
                      )
                    ],
                  ),
                ),
              ),
            ])),
          ),
      drawer: Drawer(
        // Agrega un ListView al drawer. Esto asegura que el usuario pueda desplazarse
        // a través de las opciones en el Drawer si no hay suficiente espacio vertical
        // para adaptarse a todo.
        child: drawerEstudiante(context),
      ),
    );
  }
}
