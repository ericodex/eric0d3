
import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';

/// --- VAPORWAVE FLARE FILE

class VapowaveSpace extends StatefulWidget {
  const VapowaveSpace({Key key}) : super(key: key);

  @override
  _VapowaveSpaceState createState() => _VapowaveSpaceState();
}

class _VapowaveSpaceState extends State<VapowaveSpace> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SmartFlareActor(
            width: screenSize.width,
            height: screenSize.height,
            filename: 'assets/space_vapowave.flr',
            startingAnimation: "space'84",
          )
        ));
  }
}


/// --- SWITCH DAY AND NIGHT MODE

class InterruptorCicardiano extends StatelessWidget {
  const InterruptorCicardiano({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size;
    var animationWidth = tamanhoTela.width;
    var animationHeight = tamanhoTela.height;
    var areasAtivas = [
      RelativeActiveArea(
        debugArea: true,
        area: Rect.fromLTRB(0,0,0.35,0.5),
        guardComingFrom: ['day_idle'],
        animationName: 'switch_night',
        onAreaTapped: (){
          print('tocado ummnhnhnahnnnn');
        }
      ),
      ActiveArea(
          // debugArea: true,
          area: Rect.fromLTWH(
              0, animationHeight / 2, animationWidth, animationHeight / 2),
          animationsToCycle: ['switch_day', 'switch_nigth'],
          onAreaTapped: () {
            print('Activate toggles!');
          }),
    ];


    return Scaffold(
        backgroundColor: Color.fromARGB(255, 102, 18, 222),
        body: Align(
            alignment: Alignment.bottomCenter,
            child: SmartFlareActor(
              width: animationWidth,
              height: animationHeight,
              filename: 'assets/button-animation.flr',
              startingAnimation: 'deactivate',
              activeAreas: areasAtivas,
            )));
  }
  }

