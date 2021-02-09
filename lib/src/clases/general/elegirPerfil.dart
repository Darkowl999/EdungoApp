import 'dart:convert';

import 'package:edungofrontfinal/src/animaciones/liquid_swipe.dart';
import 'package:edungofrontfinal/src/session/session.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';



class Elegir_Perfiles extends StatefulWidget {
  @override
  Perfil createState(){
    return Perfil();
  }
}

/* MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ELIGE TU PERFIL',
        home:Perfil()
    );
*/

class Perfil extends State<Elegir_Perfiles> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: LiquidSwipe(
            pages: liquidPages(context),
            fullTransitionValue: 300,
            slideIconWidget: Icon(Icons.arrow_back_ios, color: Colors.white,),
            enableLoop: true,
            enableSlideIcon: true,
            positionSlideIcon: 0.8,
            waveType: WaveType.liquidReveal,
            onPageChangeCallback: (page) => pageChangeCallback(page),
            currentUpdateTypeCallback: (updateType) => updateTypeCallback(updateType),
          )
        ),
    );
  }

  pageChangeCallback(int page) {
    print(page);
  }

  updateTypeCallback(UpdateType updateType){
    print(updateType);

  }
}
