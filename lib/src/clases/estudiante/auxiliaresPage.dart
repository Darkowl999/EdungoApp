
import 'package:edungofrontfinal/src/clases/pruebita.dart';
import 'package:edungofrontfinal/src/clases/estudiante/solicitudAuxiliatura/solicitudAuxiliatura.dart';
import 'package:edungofrontfinal/src/widgets/topContainer.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'categoryRepository.dart';


// ignore: must_be_immutable
class PagesAuxiliar extends StatefulWidget {
  @override
  String id_materia;
  String nombreMateria;
  PagesAuxiliar(this.id_materia,this.nombreMateria);

  AuxiliaresPageState createState() {
    return AuxiliaresPageState(id_materia,nombreMateria);
  }
}


//se llama PagesAuxiliar la clase//
class AuxiliaresPageState extends State<PagesAuxiliar> {


  String id_materia;
  String nombreMateria;
  AuxiliaresPageState(this.id_materia,this.nombreMateria);
  var repository = new CategoryRepository();
  List<Widget> auxiliaresList = new List<Widget>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAuxiliares();
  }

  loadAuxiliares() async {
    List result = await repository.loadAuxiliares(id_materia);
    setState(() {
      result.forEach((item) {
        var c = cartaAux(item['id_persona'], item['nombre']);
        auxiliaresList.add(c);
        auxiliaresList.add(SizedBox(
          height: 20,
        ));
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Educadores de la Materia",style: TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),),
            backgroundColor: Colors.green,
          ),
          body: SafeArea(
            child: (auxiliaresList.length == 0)? const Center(child: const CircularProgressIndicator()): listOfAuxiliares(),
          )
    );
  }


  Widget listOfAuxiliares() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: auxiliaresList.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index) {
          return auxiliaresList[index];
        });
  }

  Widget Acordeon(BuildContext context){
   return GFAccordion(
        title: 'GF Accordion',
        collapsedIcon: Icon(Icons.add),
        expandedIcon: Icon(Icons.minimize)
    );
  }


  Widget cartaAuxs(String id_persona,String nombre) {
    return InkWell(
      child: GFListTile(titleText: nombre, icon: Icon(Icons.arrow_forward_ios)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            //este navigator es para la ruta//
            builder: (context) => PagesAuxiliar('1',''),
          ),
        );
      },
    );
  }

  Widget cartaAux(String id_persona,String nombre){
    return Material(
      elevation: 5,
      child: GFListTile(
          avatar:GFAvatar(
            shape: GFAvatarShape.standard,
            size: 60,
          ),
          titleText:nombre,
          subTitle: Text("Educador de "+this.nombreMateria,style: TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),),
          description:Row(
            children: [
              SizedBox(width: 20,),
              SizedBox(
                width: 190,
                child: GFButton(
                  color: Colors.green,
                  text: "Pedir clase",
                  fullWidthButton: true,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //este navigator es para la ruta//
                        builder: (context) => solicitudAuxiliatura(id_materia,id_persona,nombreMateria),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          icon: InkWell(
            child: Icon(Icons.favorite,color: Colors.pink,),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //este navigator es para la ruta//
                    builder: (context) => toast(context)
                ),
              );
            },
          )
      ),
    );

    //nota de esta pagina podemos reemplazar las pantallas de auxiliatura grupal con un acordeon de getflutter//
  }

/*
Center(
                    child:
                    ListView(
                      children: <Widget>[
                        SizedBox(height: 50,),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 5,
                          child: GFListTile(
                              avatar:GFAvatar(
                                shape: GFAvatarShape.standard,
                                size: 60,
                              ),
                              titleText:nombre,
                              subTitle: Text("Educador de la materia",style: TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),),
                              description:Row(
                                children: [
                                  SizedBox(width: 20,),
                                  SizedBox(
                                    width: 190,
                                    child: GFButton(
                                      color: Colors.green,
                                      text: "Pedir clase",
                                      fullWidthButton: true,
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            //este navigator es para la ruta//
                                            builder: (context) => solicitudAuxiliatura(),
                                          ),
                                        );
                                        print("puto");
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              icon: InkWell(
                                child: Icon(Icons.favorite,color: Colors.pink,),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      //este navigator es para la ruta//
                                        builder: (context) => toast(context)
                                    ),
                                  );
                                },
                              )
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                ),*/

//este toast es un mensaje que se le envia de que se ha agregado correctamente a favoritos el auxiliar
  Widget toast(BuildContext context){
    return Container(
      color: Colors.white,
      child: Container(
        child:AlertDialog(
          title: Text('Agregar a favorito'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('se ha agregado a sus favoritos'),
                Text('correctamente'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Atras'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}