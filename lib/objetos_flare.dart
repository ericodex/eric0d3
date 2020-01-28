
import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';

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

class SwitchDayNight extends StatefulWidget {
  const SwitchDayNight({Key key}) : super(key: key);

  @override
  _SwitchDayNightState createState() => _SwitchDayNightState();
}

class _SwitchDayNightState extends State<SwitchDayNight> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SmartFlareActor(
            filename: 'assets/switch_daytime.flr',
            width: screenSize.width,
            height: 50,
            startingAnimation: "night_idle",
            activeAreas: [
        RelativePanArea(
          area: Rect.fromLTWH(0, 0, 0, 0),
          debugArea: false
        )
      ],
          ),
        ));
  }
}

