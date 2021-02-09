import 'package:edungofrontfinal/src/ubicaciones/ubicaciones.dart';
import 'package:edungofrontfinal/src/widgets/loadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:latlong/latlong.dart';
import 'package:http/http.dart' as http;

class AddUbicacion extends StatefulWidget{

  @override
  _AddUbicacionState createState()=>_AddUbicacionState();
}

class _AddUbicacionState extends State<AddUbicacion>{

  final controllerNombre = TextEditingController();
  final controllerDescripcion = TextEditingController();
  String nombre="";
  String descripcion="";
  http.Response response;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerNombre.addListener(() {
      nombre=controllerNombre.text;
    });
    controllerDescripcion.addListener(() {
      descripcion=controllerDescripcion.text;
    });
    return Scafold(context);
  }

  Widget Scafold(BuildContext context){
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child:todo(context)
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget todo(BuildContext context){
    return Column(
        children: [
          Stack(
            children: [
              map(context)
            ],
          ),
          espacio(MediaQuery.of(context).size.height * 0.02),
          inputNombre(context,MediaQuery.of(context).size.height * 0.03),
          espacio(MediaQuery.of(context).size.height * 0.02),
          inputDescripcion(context,MediaQuery.of(context).size.height * 0.03),
          espacio(MediaQuery.of(context).size.height * 0.05),
          boton(context,MediaQuery.of(context).size.height * 0.1),
        ]
    );
  }

  //----------------------------------WIDGETS------------------------------//
  Widget appBar(BuildContext context){
    return AppBar(
        title: Text("Nueva Ubicación"),
        backgroundColor: Colors.green
    );
  }

  Widget espacio(double size){
    return SizedBox(
      height: size,
    );
  }

  Widget map(BuildContext context){
    return Container(
      child: new FlutterMap(
        options: new MapOptions(
          center: new LatLng(51.5, -0.09),
          zoom: 13.0,
          minZoom: 10.0,
          maxZoom: 18.0,
        ),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
          ),
          new MarkerLayerOptions(
            markers: [
              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(51.5, -0.09),
                builder: (context) =>
                new Container(
                  child: IconButton(
                    icon: Icon(Icons.location_on),
                    color: Colors.red,
                    iconSize: 45,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
    );
  }

  Widget inputNombre(BuildContext context,double size){
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Nombre de la ubicación",
          contentPadding: new EdgeInsets.symmetric(vertical: size),
      ),
      controller: controllerNombre,
      keyboardType: TextInputType.text,
      validator: (value){
        if (value.isEmpty){
          return 'El nombre es un campo requerido';
        }
        return null;
      },
    );
  }

  Widget inputDescripcion(BuildContext context,double size){
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Descripción",
        contentPadding: new EdgeInsets.symmetric(vertical: size),
      ),
      controller: controllerDescripcion,
      keyboardType: TextInputType.text,
      validator: (value){
        if (value.isEmpty){
          return 'La descripcion es un campo requerido';
        }
        return null;
      },
    );
  }

  Widget boton(BuildContext context,double size) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: size,
          child: GFButton(
            color: Colors.deepPurple,
            onPressed: () async{
              loadingDialog(context);
              await validacionRequest();
              print(response.statusCode);
              if (response.statusCode == 200) {
                popDialog(context);
                popDialog(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Ubicaciones()
                  ),
                );
              }else {
                popDialog(context);
                errorDialog(context, response);
              }
            },
            text: "Guardar",
            blockButton: true,
          ),
        )
      ],
    );
  }

  Future<http.Response> validacionRequest() async {

  }

}