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
        )));
  }
}

/// --- SWITCH DAY AND NIGHT MODE

class InterruptorCicardiano extends StatefulWidget {
  const InterruptorCicardiano({Key key}) : super(key: key);

  @override
  _InterruptorCicardianoState createState() => _InterruptorCicardianoState();
}

String _estadoInterruptor = 'day_idle';
var _cor = Colors.black;

class _InterruptorCicardianoState extends State<InterruptorCicardiano> {
  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size;
    var animationWidth = tamanhoTela.width;
    var animationHeight = tamanhoTela.height;

    var areasAtivas = [
      ActiveArea(
          debugArea: true,
          area: Rect.fromLTWH(200, animationHeight / 3, animationWidth / 2,
              animationHeight / 3.2),
          guardComingFrom: ['day_idle'],
          animationsToCycle: ['switch_night'],
          //animationName: 'night_idle',
          onAreaTapped: () {
            setState(() {
              _estadoInterruptor = 'night_idle';
              _cor = Colors.black;
            });
            print('Activate Noite!' + _estadoInterruptor);
          }),
      ActiveArea(
          debugArea: true,
          area: Rect.fromLTWH(0, animationHeight / 2.8, animationWidth / 2.1,
              animationHeight / 3.5),
          guardComingFrom: ['night_idle'],
          animationsToCycle: ['switch_day'],
          //animationName: 'day_idle',
          onAreaTapped: () {
            print('Activate Dia!' + _estadoInterruptor);
            setState(() {
              _estadoInterruptor = 'day_idle';
              _cor = Colors.grey;
            });
          }),
    ];
    return Scaffold(
        backgroundColor: _cor,
        body: Align(
            alignment: Alignment.bottomCenter,
            child: SmartFlareActor(
              width: animationWidth,
              height: animationHeight,
              filename: 'assets/switch_daytime.flr',
              startingAnimation: _estadoInterruptor,
              activeAreas: areasAtivas,
            )));
  }
}
