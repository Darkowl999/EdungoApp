
import 'package:edungofrontfinal/src/Login/login.dart';
import 'package:flutter/material.dart';
 //importe aca la clase homePage que servirá como guia//
import 'dart:async'; //no tengo idea de para que sea esto pero es importante//
import 'package:flutter_localizations/flutter_localizations.dart';
//ESTE VENDRIA A SER EL SPLASH SCREEN//
void main() {

  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('es'),
    ],
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));

}
//clase que vendria siendo el home//

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //TODA ESTA CLASE Y WIDGETS SON PARTE DEL SPLASH SCREEN

  @override //este init state da inicio a los segundos que tardara el splash o durara
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {

      //if (existeArchivo...)

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          //este navigator es para la ruta//
          builder: (context) =>LoginScreen()
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {     
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Image.asset("assets/logoedungo.png", alignment: Alignment.center, height: 300, width: 300,),
      ),
    );
  }
}//HASTA ACA ES ESTA EL ESPLASH SCREEN//  