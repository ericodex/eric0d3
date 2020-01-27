import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Space extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        child: Container(
            width: 600,
            height: 400,
            child: FlareActor("assets/space_vapowave.flr",
                animation: "space'84"
                )));
  }
}

class DayNigth extends StatelessWidget {

  bool interruptor = false;
  final VoidCallback onToggle;
  final bool snapToEnd;

  DayNigth(this.interruptor,{this.snapToEnd,this.onToggle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onToggle,
        child: Container(
            width: 600,
            height: 400,
            child: FlareActor("assets/switch_daytime.flr",
                  animation: interruptor ? "night_idle" : "day_idle"
                  ),
                
            ));
  }
}